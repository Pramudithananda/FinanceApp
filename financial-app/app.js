(function() {
  const bankBalanceEl = document.getElementById('bank-balance');
  const cashBalanceEl = document.getElementById('cash-balance');
  const netWorthEl = document.getElementById('net-worth');
  const form = document.getElementById('txn-form');
  const kindEl = document.getElementById('txn-kind');
  const accountEl = document.getElementById('account');
  const transferToRow = document.getElementById('transfer-to-row');
  const transferToEl = document.getElementById('transfer-to');
  const amountEl = document.getElementById('amount');
  const dateEl = document.getElementById('date');
  const noteEl = document.getElementById('note');
  const historyList = document.getElementById('history-list');
  const quickDeposit = document.getElementById('quick-deposit');
  const quickWithdraw = document.getElementById('quick-withdraw');
  const resetData = document.getElementById('reset-data');

  const STORAGE_KEY = 'finance-data-v1';

  /** @type {{ bank: number, cash: number, txns: Array<{id:string, kind:'income'|'expense'|'transfer', account:'bank'|'cash', to?:'bank'|'cash', amount:number, date:string, note:string}> }} */
  let state = load();

  function load() {
    try {
      const raw = localStorage.getItem(STORAGE_KEY);
      if (!raw) return { bank: 0, cash: 0, txns: [] };
      const parsed = JSON.parse(raw);
      return { bank: Number(parsed.bank||0), cash: Number(parsed.cash||0), txns: parsed.txns||[] };
    } catch (_) {
      return { bank: 0, cash: 0, txns: [] };
    }
  }

  function save() {
    localStorage.setItem(STORAGE_KEY, JSON.stringify(state));
  }

  function formatAmount(v) {
    return Number(v).toLocaleString('si-LK', { style: 'currency', currency: 'LKR' });
  }

  function render() {
    bankBalanceEl.textContent = formatAmount(state.bank);
    cashBalanceEl.textContent = formatAmount(state.cash);
    netWorthEl.textContent = formatAmount(state.bank + state.cash);
    renderHistory();
  }

  function renderHistory() {
    historyList.innerHTML = '';
    state.txns.slice().reverse().forEach(txn => {
      const li = document.createElement('li');
      const date = document.createElement('div');
      const note = document.createElement('div');
      const account = document.createElement('div');
      const amount = document.createElement('div');

      date.textContent = txn.date || '';
      note.textContent = txn.note || '-';
      account.textContent = txn.kind === 'transfer' ? `${txn.account} ➜ ${txn.to}` : txn.account;
      amount.textContent = (txn.kind === 'expense' ? '-' : '+') + formatAmount(txn.amount);
      amount.className = txn.kind === 'expense' ? 'amount-neg' : 'amount-pos';

      li.append(date, note, account, amount);
      historyList.appendChild(li);
    });
  }

  function addTxn(txn) {
    state.txns.push(txn);
    save();
    render();
  }

  function uuid() { return Math.random().toString(36).slice(2, 10); }

  function applyBusinessLogic({ kind, account, to, amount }) {
    if (kind === 'income') {
      if (account === 'bank') state.bank += amount; else state.cash += amount;
    } else if (kind === 'expense') {
      if (account === 'bank') state.bank -= amount; else state.cash -= amount;
    } else if (kind === 'transfer') {
      if (account === 'bank' && to === 'cash') { state.bank -= amount; state.cash += amount; }
      if (account === 'cash' && to === 'bank') { state.cash -= amount; state.bank += amount; }
    }
    state.bank = Math.max(0, Number(state.bank.toFixed(2)));
    state.cash = Math.max(0, Number(state.cash.toFixed(2)));
  }

  kindEl.addEventListener('change', () => {
    const isTransfer = kindEl.value === 'transfer';
    transferToRow.style.display = isTransfer ? '' : 'none';
  });

  form.addEventListener('submit', (e) => {
    e.preventDefault();
    const kind = /** @type any */ (kindEl.value);
    const account = /** @type any */ (accountEl.value);
    const to = /** @type any */ (transferToEl.value);
    const amount = Number(amountEl.value);
    const date = dateEl.value || new Date().toISOString().slice(0,10);
    const note = noteEl.value.trim();

    if (!Number.isFinite(amount) || amount <= 0) {
      alert('Invalid amount');
      return;
    }

    applyBusinessLogic({ kind, account, to, amount });

    addTxn({ id: uuid(), kind, account, to, amount, date, note });

    form.reset();
    transferToRow.style.display = 'none';
  });

  quickDeposit.addEventListener('click', () => {
    const amount = prompt('Cash ➜ Bank amount (LKR)');
    if (!amount) return;
    const v = Number(amount);
    if (!Number.isFinite(v) || v <= 0) return;
    applyBusinessLogic({ kind: 'transfer', account: 'cash', to: 'bank', amount: v });
    addTxn({ id: uuid(), kind: 'transfer', account: 'cash', to: 'bank', amount: v, date: new Date().toISOString().slice(0,10), note: 'Quick deposit' });
  });

  quickWithdraw.addEventListener('click', () => {
    const amount = prompt('Bank ➜ Cash amount (LKR)');
    if (!amount) return;
    const v = Number(amount);
    if (!Number.isFinite(v) || v <= 0) return;
    applyBusinessLogic({ kind: 'transfer', account: 'bank', to: 'cash', amount: v });
    addTxn({ id: uuid(), kind: 'transfer', account: 'bank', to: 'cash', amount: v, date: new Date().toISOString().slice(0,10), note: 'Quick withdraw' });
  });

  resetData.addEventListener('click', () => {
    if (!confirm('Clear all data?')) return;
    state = { bank: 0, cash: 0, txns: [] };
    save();
    render();
  });

  // Initialize
  render();
})();
