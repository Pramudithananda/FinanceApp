.class public final synthetic Lcom/facebook/hermes/intl/PlatformCollatorICU$$ExternalSyntheticApiModelOutline3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"


# direct methods
.method public static bridge synthetic m(Landroid/icu/text/DecimalFormatSymbols;)C
    .locals 0

    invoke-virtual {p0}, Landroid/icu/text/DecimalFormatSymbols;->getPlusSign()C

    move-result p0

    return p0
.end method

.method public static bridge synthetic m(Landroid/graphics/ColorSpace;)I
    .locals 0

    invoke-virtual {p0}, Landroid/graphics/ColorSpace;->hashCode()I

    move-result p0

    return p0
.end method

.method public static bridge synthetic m(Landroid/icu/text/DecimalFormat;)I
    .locals 0

    invoke-virtual {p0}, Landroid/icu/text/DecimalFormat;->getMinimumSignificantDigits()I

    move-result p0

    return p0
.end method

.method public static bridge synthetic m(Landroid/icu/text/RuleBasedCollator;)I
    .locals 0

    invoke-virtual {p0}, Landroid/icu/text/RuleBasedCollator;->getStrength()I

    move-result p0

    return p0
.end method

.method public static bridge synthetic m(Landroid/icu/util/Currency;)I
    .locals 0

    invoke-virtual {p0}, Landroid/icu/util/Currency;->getDefaultFractionDigits()I

    move-result p0

    return p0
.end method

.method public static bridge synthetic m()Landroid/icu/text/CompactDecimalFormat$CompactStyle;
    .locals 1

    sget-object v0, Landroid/icu/text/CompactDecimalFormat$CompactStyle;->SHORT:Landroid/icu/text/CompactDecimalFormat$CompactStyle;

    return-object v0
.end method

.method public static bridge synthetic m(Landroid/icu/util/ULocale;Landroid/icu/text/CompactDecimalFormat$CompactStyle;)Landroid/icu/text/CompactDecimalFormat;
    .locals 0

    invoke-static {p0, p1}, Landroid/icu/text/CompactDecimalFormat;->getInstance(Landroid/icu/util/ULocale;Landroid/icu/text/CompactDecimalFormat$CompactStyle;)Landroid/icu/text/CompactDecimalFormat;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m()Landroid/icu/text/DateFormat$Field;
    .locals 1

    sget-object v0, Landroid/icu/text/DateFormat$Field;->YEAR:Landroid/icu/text/DateFormat$Field;

    return-object v0
.end method

.method public static bridge synthetic m(IILandroid/icu/util/ULocale;)Landroid/icu/text/DateFormat;
    .locals 0

    invoke-static {p0, p1, p2}, Landroid/icu/text/DateFormat;->getDateTimeInstance(IILandroid/icu/util/ULocale;)Landroid/icu/text/DateFormat;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(ILandroid/icu/util/ULocale;)Landroid/icu/text/DateFormat;
    .locals 0

    invoke-static {p0, p1}, Landroid/icu/text/DateFormat;->getTimeInstance(ILandroid/icu/util/ULocale;)Landroid/icu/text/DateFormat;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/icu/util/Calendar;Ljava/lang/String;Landroid/icu/util/ULocale;)Landroid/icu/text/DateFormat;
    .locals 0

    invoke-static {p0, p1, p2}, Landroid/icu/text/DateFormat;->getPatternInstance(Landroid/icu/util/Calendar;Ljava/lang/String;Landroid/icu/util/ULocale;)Landroid/icu/text/DateFormat;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Ljava/lang/String;Landroid/icu/util/ULocale;)Landroid/icu/text/DateFormat;
    .locals 0

    invoke-static {p0, p1}, Landroid/icu/text/DateFormat;->getPatternInstance(Ljava/lang/String;Landroid/icu/util/ULocale;)Landroid/icu/text/DateFormat;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Ljava/lang/Object;)Landroid/icu/text/DecimalFormat;
    .locals 0

    check-cast p0, Landroid/icu/text/DecimalFormat;

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/icu/text/DecimalFormat;)Landroid/icu/text/DecimalFormatSymbols;
    .locals 0

    invoke-virtual {p0}, Landroid/icu/text/DecimalFormat;->getDecimalFormatSymbols()Landroid/icu/text/DecimalFormatSymbols;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/icu/util/ULocale;Landroid/icu/text/MeasureFormat$FormatWidth;Landroid/icu/text/NumberFormat;)Landroid/icu/text/MeasureFormat;
    .locals 0

    invoke-static {p0, p1, p2}, Landroid/icu/text/MeasureFormat;->getInstance(Landroid/icu/util/ULocale;Landroid/icu/text/MeasureFormat$FormatWidth;Landroid/icu/text/NumberFormat;)Landroid/icu/text/MeasureFormat;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m()Landroid/icu/text/NumberFormat$Field;
    .locals 1

    sget-object v0, Landroid/icu/text/NumberFormat$Field;->SIGN:Landroid/icu/text/NumberFormat$Field;

    return-object v0
.end method

.method public static bridge synthetic m(Landroid/icu/util/ULocale;)Landroid/icu/text/NumberFormat;
    .locals 0

    invoke-static {p0}, Landroid/icu/text/NumberFormat;->getInstance(Landroid/icu/util/ULocale;)Landroid/icu/text/NumberFormat;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/icu/util/ULocale;I)Landroid/icu/text/NumberFormat;
    .locals 0

    invoke-static {p0, p1}, Landroid/icu/text/NumberFormat;->getInstance(Landroid/icu/util/ULocale;I)Landroid/icu/text/NumberFormat;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/icu/util/ULocale;)Landroid/icu/text/NumberingSystem;
    .locals 0

    invoke-static {p0}, Landroid/icu/text/NumberingSystem;->getInstance(Landroid/icu/util/ULocale;)Landroid/icu/text/NumberingSystem;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Ljava/lang/String;)Landroid/icu/text/NumberingSystem;
    .locals 0

    invoke-static {p0}, Landroid/icu/text/NumberingSystem;->getInstanceByName(Ljava/lang/String;)Landroid/icu/text/NumberingSystem;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Ljava/lang/Object;)Landroid/icu/text/SimpleDateFormat;
    .locals 0

    check-cast p0, Landroid/icu/text/SimpleDateFormat;

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/icu/text/DateFormat;)Landroid/icu/util/Calendar;
    .locals 0

    invoke-virtual {p0}, Landroid/icu/text/DateFormat;->getCalendar()Landroid/icu/util/Calendar;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/icu/util/ULocale;)Landroid/icu/util/Calendar;
    .locals 0

    invoke-static {p0}, Landroid/icu/util/Calendar;->getInstance(Landroid/icu/util/ULocale;)Landroid/icu/util/Calendar;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Ljava/lang/String;)Landroid/icu/util/Currency;
    .locals 0

    invoke-static {p0}, Landroid/icu/util/Currency;->getInstance(Ljava/lang/String;)Landroid/icu/util/Currency;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic m(Ljava/lang/Number;Landroid/icu/util/MeasureUnit;)Landroid/icu/util/Measure;
    .locals 1

    new-instance v0, Landroid/icu/util/Measure;

    invoke-direct {v0, p0, p1}, Landroid/icu/util/Measure;-><init>(Ljava/lang/Number;Landroid/icu/util/MeasureUnit;)V

    return-object v0
.end method

.method public static bridge synthetic m(Ljava/lang/Object;)Landroid/icu/util/MeasureUnit;
    .locals 0

    check-cast p0, Landroid/icu/util/MeasureUnit;

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/icu/util/Calendar;)Landroid/icu/util/TimeZone;
    .locals 0

    invoke-virtual {p0}, Landroid/icu/util/Calendar;->getTimeZone()Landroid/icu/util/TimeZone;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Ljava/lang/String;)Landroid/icu/util/TimeZone;
    .locals 0

    invoke-static {p0}, Landroid/icu/util/TimeZone;->getTimeZone(Ljava/lang/String;)Landroid/icu/util/TimeZone;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m()Landroid/icu/util/ULocale;
    .locals 1

    invoke-static {}, Landroid/icu/util/ULocale;->getDefault()Landroid/icu/util/ULocale;

    move-result-object v0

    return-object v0
.end method

.method public static bridge synthetic m(Ljava/lang/String;)Landroid/icu/util/ULocale;
    .locals 0

    invoke-static {p0}, Landroid/icu/util/ULocale;->forLanguageTag(Ljava/lang/String;)Landroid/icu/util/ULocale;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/icu/text/DateFormat;Ljava/util/Date;)Ljava/lang/String;
    .locals 0

    invoke-virtual {p0, p1}, Landroid/icu/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/icu/text/DecimalFormat;)Ljava/lang/String;
    .locals 0

    invoke-virtual {p0}, Landroid/icu/text/DecimalFormat;->getNegativeSuffix()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/icu/text/NumberFormat;D)Ljava/lang/String;
    .locals 0

    invoke-virtual {p0, p1, p2}, Landroid/icu/text/NumberFormat;->format(D)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/icu/text/NumberingSystem;)Ljava/lang/String;
    .locals 0

    invoke-virtual {p0}, Landroid/icu/text/NumberingSystem;->getName()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/icu/text/SimpleDateFormat;)Ljava/lang/String;
    .locals 0

    invoke-virtual {p0}, Landroid/icu/text/SimpleDateFormat;->toLocalizedPattern()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/icu/util/Calendar;)Ljava/lang/String;
    .locals 0

    invoke-virtual {p0}, Landroid/icu/util/Calendar;->getType()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/icu/util/Currency;Landroid/icu/util/ULocale;I[Z)Ljava/lang/String;
    .locals 0

    invoke-virtual {p0, p1, p2, p3}, Landroid/icu/util/Currency;->getName(Landroid/icu/util/ULocale;I[Z)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/icu/util/MeasureUnit;)Ljava/lang/String;
    .locals 0

    invoke-virtual {p0}, Landroid/icu/util/MeasureUnit;->getSubtype()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/icu/util/TimeZone;)Ljava/lang/String;
    .locals 0

    invoke-virtual {p0}, Landroid/icu/util/TimeZone;->getID()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/icu/text/DateFormat;Ljava/lang/Object;)Ljava/text/AttributedCharacterIterator;
    .locals 0

    invoke-virtual {p0, p1}, Landroid/icu/text/DateFormat;->formatToCharacterIterator(Ljava/lang/Object;)Ljava/text/AttributedCharacterIterator;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/icu/text/NumberFormat;Ljava/lang/Object;)Ljava/text/AttributedCharacterIterator;
    .locals 0

    invoke-virtual {p0, p1}, Landroid/icu/text/NumberFormat;->formatToCharacterIterator(Ljava/lang/Object;)Ljava/text/AttributedCharacterIterator;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m()Ljava/util/Set;
    .locals 1

    invoke-static {}, Landroid/icu/util/MeasureUnit;->getAvailable()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public static synthetic m()V
    .locals 1

    new-instance v0, Landroid/icu/util/Measure;

    return-void
.end method

.method public static bridge synthetic m(Landroid/icu/text/DateFormat;Landroid/icu/util/TimeZone;)V
    .locals 0

    invoke-virtual {p0, p1}, Landroid/icu/text/DateFormat;->setTimeZone(Landroid/icu/util/TimeZone;)V

    return-void
.end method

.method public static bridge synthetic m(Landroid/icu/text/DecimalFormat;I)V
    .locals 0

    invoke-virtual {p0, p1}, Landroid/icu/text/DecimalFormat;->setMinimumSignificantDigits(I)V

    return-void
.end method

.method public static bridge synthetic m(Landroid/icu/text/DecimalFormat;Landroid/icu/text/DecimalFormatSymbols;)V
    .locals 0

    invoke-virtual {p0, p1}, Landroid/icu/text/DecimalFormat;->setDecimalFormatSymbols(Landroid/icu/text/DecimalFormatSymbols;)V

    return-void
.end method

.method public static bridge synthetic m(Landroid/icu/text/DecimalFormat;Ljava/lang/String;)V
    .locals 0

    invoke-virtual {p0, p1}, Landroid/icu/text/DecimalFormat;->setPositiveSuffix(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic m(Landroid/icu/text/DecimalFormat;Z)V
    .locals 0

    invoke-virtual {p0, p1}, Landroid/icu/text/DecimalFormat;->setSignificantDigitsUsed(Z)V

    return-void
.end method

.method public static bridge synthetic m(Landroid/icu/text/DecimalFormatSymbols;Ljava/lang/String;)V
    .locals 0

    invoke-virtual {p0, p1}, Landroid/icu/text/DecimalFormatSymbols;->setCurrencySymbol(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic m(Landroid/icu/text/NumberFormat;I)V
    .locals 0

    invoke-virtual {p0, p1}, Landroid/icu/text/NumberFormat;->setMinimumFractionDigits(I)V

    return-void
.end method

.method public static bridge synthetic m(Landroid/icu/text/NumberFormat;Landroid/icu/util/Currency;)V
    .locals 0

    invoke-virtual {p0, p1}, Landroid/icu/text/NumberFormat;->setCurrency(Landroid/icu/util/Currency;)V

    return-void
.end method

.method public static bridge synthetic m(Landroid/icu/text/NumberFormat;Z)V
    .locals 0

    invoke-virtual {p0, p1}, Landroid/icu/text/NumberFormat;->setGroupingUsed(Z)V

    return-void
.end method

.method public static bridge synthetic m(Landroid/icu/text/RuleBasedCollator;)V
    .locals 0

    invoke-virtual {p0}, Landroid/icu/text/RuleBasedCollator;->setCaseFirstDefault()V

    return-void
.end method

.method public static bridge synthetic m(Landroid/icu/text/RuleBasedCollator;I)V
    .locals 0

    invoke-virtual {p0, p1}, Landroid/icu/text/RuleBasedCollator;->setStrength(I)V

    return-void
.end method

.method public static bridge synthetic m(Landroid/icu/text/RuleBasedCollator;Z)V
    .locals 0

    invoke-virtual {p0, p1}, Landroid/icu/text/RuleBasedCollator;->setCaseLevel(Z)V

    return-void
.end method

.method public static bridge synthetic m(Landroid/os/SharedMemory;)V
    .locals 0

    invoke-virtual {p0}, Landroid/os/SharedMemory;->close()V

    return-void
.end method

.method public static bridge synthetic m(Ljava/nio/ByteBuffer;)V
    .locals 0

    invoke-static {p0}, Landroid/os/SharedMemory;->unmap(Ljava/nio/ByteBuffer;)V

    return-void
.end method

.method public static bridge synthetic m(Landroid/icu/text/RuleBasedCollator;)Z
    .locals 0

    invoke-virtual {p0}, Landroid/icu/text/RuleBasedCollator;->isCaseLevel()Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic m(Ljava/lang/Object;)Z
    .locals 0

    instance-of p0, p0, Landroid/icu/text/DecimalFormat;

    return p0
.end method

.method public static bridge synthetic m()[Ljava/lang/String;
    .locals 1

    invoke-static {}, Landroid/icu/text/NumberingSystem;->getAvailableNames()[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static bridge synthetic m(Ljava/lang/String;Landroid/icu/util/ULocale;Z)[Ljava/lang/String;
    .locals 0

    invoke-static {p0, p1, p2}, Landroid/icu/text/RuleBasedCollator;->getKeywordValuesForLocale(Ljava/lang/String;Landroid/icu/util/ULocale;Z)[Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m$1()Landroid/icu/text/CompactDecimalFormat$CompactStyle;
    .locals 1

    sget-object v0, Landroid/icu/text/CompactDecimalFormat$CompactStyle;->LONG:Landroid/icu/text/CompactDecimalFormat$CompactStyle;

    return-object v0
.end method

.method public static bridge synthetic m$1()Landroid/icu/text/DateFormat$Field;
    .locals 1

    sget-object v0, Landroid/icu/text/DateFormat$Field;->MONTH:Landroid/icu/text/DateFormat$Field;

    return-object v0
.end method

.method public static bridge synthetic m$1(ILandroid/icu/util/ULocale;)Landroid/icu/text/DateFormat;
    .locals 0

    invoke-static {p0, p1}, Landroid/icu/text/DateFormat;->getDateInstance(ILandroid/icu/util/ULocale;)Landroid/icu/text/DateFormat;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m$1()Landroid/icu/text/NumberFormat$Field;
    .locals 1

    sget-object v0, Landroid/icu/text/NumberFormat$Field;->CURRENCY:Landroid/icu/text/NumberFormat$Field;

    return-object v0
.end method

.method public static bridge synthetic m$1(Landroid/icu/text/DecimalFormat;)Ljava/lang/String;
    .locals 0

    invoke-virtual {p0}, Landroid/icu/text/DecimalFormat;->getNegativePrefix()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m$1(Landroid/icu/text/SimpleDateFormat;)Ljava/lang/String;
    .locals 0

    invoke-virtual {p0}, Landroid/icu/text/SimpleDateFormat;->toPattern()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m$1(Landroid/icu/util/MeasureUnit;)Ljava/lang/String;
    .locals 0

    invoke-virtual {p0}, Landroid/icu/util/MeasureUnit;->getType()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m$1(Landroid/icu/text/DecimalFormat;I)V
    .locals 0

    invoke-virtual {p0, p1}, Landroid/icu/text/DecimalFormat;->setMaximumSignificantDigits(I)V

    return-void
.end method

.method public static bridge synthetic m$1(Landroid/icu/text/DecimalFormat;Ljava/lang/String;)V
    .locals 0

    invoke-virtual {p0, p1}, Landroid/icu/text/DecimalFormat;->setPositivePrefix(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic m$1(Landroid/icu/text/NumberFormat;I)V
    .locals 0

    invoke-virtual {p0, p1}, Landroid/icu/text/NumberFormat;->setRoundingMode(I)V

    return-void
.end method

.method public static bridge synthetic m$1(Landroid/icu/text/RuleBasedCollator;Z)V
    .locals 0

    invoke-virtual {p0, p1}, Landroid/icu/text/RuleBasedCollator;->setNumericCollation(Z)V

    return-void
.end method

.method public static bridge synthetic m$1(Ljava/lang/Object;)Z
    .locals 0

    instance-of p0, p0, Landroid/icu/text/MeasureFormat;

    return p0
.end method

.method public static bridge synthetic m$1(Ljava/lang/String;Landroid/icu/util/ULocale;Z)[Ljava/lang/String;
    .locals 0

    invoke-static {p0, p1, p2}, Landroid/icu/util/Calendar;->getKeywordValuesForLocale(Ljava/lang/String;Landroid/icu/util/ULocale;Z)[Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m$10()Landroid/icu/text/DateFormat$Field;
    .locals 1

    sget-object v0, Landroid/icu/text/DateFormat$Field;->HOUR_OF_DAY0:Landroid/icu/text/DateFormat$Field;

    return-object v0
.end method

.method public static bridge synthetic m$10()Landroid/icu/text/NumberFormat$Field;
    .locals 1

    sget-object v0, Landroid/icu/text/NumberFormat$Field;->PERMILLE:Landroid/icu/text/NumberFormat$Field;

    return-object v0
.end method

.method public static bridge synthetic m$11()Landroid/icu/text/DateFormat$Field;
    .locals 1

    sget-object v0, Landroid/icu/text/DateFormat$Field;->HOUR_OF_DAY1:Landroid/icu/text/DateFormat$Field;

    return-object v0
.end method

.method public static bridge synthetic m$12()Landroid/icu/text/DateFormat$Field;
    .locals 1

    sget-object v0, Landroid/icu/text/DateFormat$Field;->MINUTE:Landroid/icu/text/DateFormat$Field;

    return-object v0
.end method

.method public static bridge synthetic m$2()Landroid/icu/text/DateFormat$Field;
    .locals 1

    sget-object v0, Landroid/icu/text/DateFormat$Field;->DAY_OF_WEEK:Landroid/icu/text/DateFormat$Field;

    return-object v0
.end method

.method public static bridge synthetic m$2()Landroid/icu/text/NumberFormat$Field;
    .locals 1

    sget-object v0, Landroid/icu/text/NumberFormat$Field;->INTEGER:Landroid/icu/text/NumberFormat$Field;

    return-object v0
.end method

.method public static bridge synthetic m$2(Landroid/icu/text/DecimalFormat;Ljava/lang/String;)V
    .locals 0

    invoke-virtual {p0, p1}, Landroid/icu/text/DecimalFormat;->setNegativePrefix(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic m$2(Landroid/icu/text/NumberFormat;I)V
    .locals 0

    invoke-virtual {p0, p1}, Landroid/icu/text/NumberFormat;->setMinimumIntegerDigits(I)V

    return-void
.end method

.method public static bridge synthetic m$2(Landroid/icu/text/RuleBasedCollator;Z)V
    .locals 0

    invoke-virtual {p0, p1}, Landroid/icu/text/RuleBasedCollator;->setLowerCaseFirst(Z)V

    return-void
.end method

.method public static bridge synthetic m$3()Landroid/icu/text/DateFormat$Field;
    .locals 1

    sget-object v0, Landroid/icu/text/DateFormat$Field;->SECOND:Landroid/icu/text/DateFormat$Field;

    return-object v0
.end method

.method public static bridge synthetic m$3()Landroid/icu/text/NumberFormat$Field;
    .locals 1

    sget-object v0, Landroid/icu/text/NumberFormat$Field;->FRACTION:Landroid/icu/text/NumberFormat$Field;

    return-object v0
.end method

.method public static bridge synthetic m$3(Landroid/icu/text/DecimalFormat;Ljava/lang/String;)V
    .locals 0

    invoke-virtual {p0, p1}, Landroid/icu/text/DecimalFormat;->setNegativeSuffix(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic m$3(Landroid/icu/text/NumberFormat;I)V
    .locals 0

    invoke-virtual {p0, p1}, Landroid/icu/text/NumberFormat;->setMaximumIntegerDigits(I)V

    return-void
.end method

.method public static bridge synthetic m$4()Landroid/icu/text/DateFormat$Field;
    .locals 1

    sget-object v0, Landroid/icu/text/DateFormat$Field;->DAY_OF_MONTH:Landroid/icu/text/DateFormat$Field;

    return-object v0
.end method

.method public static bridge synthetic m$4()Landroid/icu/text/NumberFormat$Field;
    .locals 1

    sget-object v0, Landroid/icu/text/NumberFormat$Field;->EXPONENT:Landroid/icu/text/NumberFormat$Field;

    return-object v0
.end method

.method public static bridge synthetic m$4(Landroid/icu/text/NumberFormat;I)V
    .locals 0

    invoke-virtual {p0, p1}, Landroid/icu/text/NumberFormat;->setMaximumFractionDigits(I)V

    return-void
.end method

.method public static bridge synthetic m$5()Landroid/icu/text/DateFormat$Field;
    .locals 1

    sget-object v0, Landroid/icu/text/DateFormat$Field;->TIME_ZONE:Landroid/icu/text/DateFormat$Field;

    return-object v0
.end method

.method public static bridge synthetic m$5()Landroid/icu/text/NumberFormat$Field;
    .locals 1

    sget-object v0, Landroid/icu/text/NumberFormat$Field;->EXPONENT_SIGN:Landroid/icu/text/NumberFormat$Field;

    return-object v0
.end method

.method public static bridge synthetic m$6()Landroid/icu/text/DateFormat$Field;
    .locals 1

    sget-object v0, Landroid/icu/text/DateFormat$Field;->AM_PM:Landroid/icu/text/DateFormat$Field;

    return-object v0
.end method

.method public static bridge synthetic m$6()Landroid/icu/text/NumberFormat$Field;
    .locals 1

    sget-object v0, Landroid/icu/text/NumberFormat$Field;->EXPONENT_SYMBOL:Landroid/icu/text/NumberFormat$Field;

    return-object v0
.end method

.method public static bridge synthetic m$7()Landroid/icu/text/DateFormat$Field;
    .locals 1

    sget-object v0, Landroid/icu/text/DateFormat$Field;->ERA:Landroid/icu/text/DateFormat$Field;

    return-object v0
.end method

.method public static bridge synthetic m$7()Landroid/icu/text/NumberFormat$Field;
    .locals 1

    sget-object v0, Landroid/icu/text/NumberFormat$Field;->DECIMAL_SEPARATOR:Landroid/icu/text/NumberFormat$Field;

    return-object v0
.end method

.method public static bridge synthetic m$8()Landroid/icu/text/DateFormat$Field;
    .locals 1

    sget-object v0, Landroid/icu/text/DateFormat$Field;->HOUR0:Landroid/icu/text/DateFormat$Field;

    return-object v0
.end method

.method public static bridge synthetic m$8()Landroid/icu/text/NumberFormat$Field;
    .locals 1

    sget-object v0, Landroid/icu/text/NumberFormat$Field;->GROUPING_SEPARATOR:Landroid/icu/text/NumberFormat$Field;

    return-object v0
.end method

.method public static bridge synthetic m$9()Landroid/icu/text/DateFormat$Field;
    .locals 1

    sget-object v0, Landroid/icu/text/DateFormat$Field;->HOUR1:Landroid/icu/text/DateFormat$Field;

    return-object v0
.end method

.method public static bridge synthetic m$9()Landroid/icu/text/NumberFormat$Field;
    .locals 1

    sget-object v0, Landroid/icu/text/NumberFormat$Field;->PERCENT:Landroid/icu/text/NumberFormat$Field;

    return-object v0
.end method
