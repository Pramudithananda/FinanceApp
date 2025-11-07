#!/usr/bin/env python3
"""
Script to create Android app icons from SVG
This creates a simple financial app icon using PIL/Pillow
"""

try:
    from PIL import Image, ImageDraw, ImageFont
    import os
    
    def create_icon(size, output_path):
        """Create an icon of specified size"""
        # Create image with transparent background
        img = Image.new('RGBA', (size, size), (0, 0, 0, 0))
        draw = ImageDraw.Draw(img)
        
        # Background circle - blue gradient
        center = size // 2
        radius = int(size * 0.45)
        
        # Draw outer circle (dark blue)
        draw.ellipse(
            [center - radius, center - radius, center + radius, center + radius],
            fill=(30, 58, 138),  # #1e3a8a
            outline=(14, 165, 233),  # #0ea5e9
            width=max(2, size // 64)
        )
        
        # Inner circle (lighter blue)
        inner_radius = int(radius * 0.83)
        draw.ellipse(
            [center - inner_radius, center - inner_radius, 
             center + inner_radius, center + inner_radius],
            fill=(59, 130, 246, 76)  # #3b82f6 with opacity
        )
        
        # Draw wallet shape
        wallet_width = int(size * 0.47)
        wallet_height = int(size * 0.23)
        wallet_x = center - wallet_width // 2
        wallet_y = center - wallet_height // 2 + int(size * 0.05)
        
        # Wallet base (green)
        draw.rounded_rectangle(
            [wallet_x, wallet_y, wallet_x + wallet_width, wallet_y + wallet_height],
            radius=int(size * 0.03),
            fill=(16, 185, 129),  # #10b981
            outline=(5, 150, 105),  # #059669
            width=max(1, size // 128)
        )
        
        # Wallet fold
        fold_points = [
            (wallet_x, wallet_y),
            (wallet_x, wallet_y + int(wallet_height * 0.25)),
            (center, wallet_y + int(wallet_height * 0.25)),
            (center, wallet_y + int(wallet_height * 0.5)),
            (wallet_x, wallet_y + int(wallet_height * 0.5)),
            (wallet_x, wallet_y + wallet_height)
        ]
        draw.polygon(fold_points, fill=(5, 150, 105))
        
        # Money symbol (රු) - simplified as text or symbol
        try:
            # Try to use a font if available
            font_size = int(size * 0.15)
            try:
                font = ImageFont.truetype("/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf", font_size)
            except:
                try:
                    font = ImageFont.truetype("/System/Library/Fonts/Helvetica.ttc", font_size)
                except:
                    font = ImageFont.load_default()
            
            # Draw "රු" text or use a symbol
            text = "රු"
            bbox = draw.textbbox((0, 0), text, font=font)
            text_width = bbox[2] - bbox[0]
            text_height = bbox[3] - bbox[1]
            text_x = center - text_width // 2
            text_y = center - text_height // 2 + int(size * 0.05)
            draw.text((text_x, text_y), text, fill=(255, 255, 255), font=font)
        except Exception as e:
            # Fallback: draw a simple "$" or coin symbol
            coin_radius = int(size * 0.08)
            draw.ellipse(
                [center - coin_radius, center - coin_radius + int(size * 0.05),
                 center + coin_radius, center + coin_radius + int(size * 0.05)],
                fill=(251, 191, 36),  # Gold
                outline=(245, 158, 11)
            )
        
        # Decorative coins
        coin_size = int(size * 0.1)
        # Top left coin
        coin_x1 = center - int(size * 0.27)
        coin_y1 = center - int(size * 0.27)
        draw.ellipse(
            [coin_x1 - coin_size//2, coin_y1 - coin_size//2,
             coin_x1 + coin_size//2, coin_y1 + coin_size//2],
            fill=(251, 191, 36),
            outline=(245, 158, 11),
            width=max(1, size // 128)
        )
        
        # Top right coin
        coin_x2 = center + int(size * 0.27)
        coin_y2 = center - int(size * 0.27)
        draw.ellipse(
            [coin_x2 - coin_size//2, coin_y2 - coin_size//2,
             coin_x2 + coin_size//2, coin_y2 + coin_size//2],
            fill=(251, 191, 36),
            outline=(245, 158, 11),
            width=max(1, size // 128)
        )
        
        # Save icon
        img.save(output_path, 'PNG')
        print(f"Created icon: {output_path} ({size}x{size})")
    
    # Create icons for different densities
    densities = {
        'mipmap-mdpi': 48,
        'mipmap-hdpi': 72,
        'mipmap-xhdpi': 96,
        'mipmap-xxhdpi': 144,
        'mipmap-xxxhdpi': 192
    }
    
    base_path = 'android/app/src/main/res'
    
    for density, size in densities.items():
        os.makedirs(f'{base_path}/{density}', exist_ok=True)
        create_icon(size, f'{base_path}/{density}/ic_launcher.png')
        create_icon(size, f'{base_path}/{density}/ic_launcher_round.png')
    
    print("\n✅ All icons created successfully!")
    print("Icons are ready for Android app.")
    
except ImportError:
    print("PIL/Pillow not installed. Installing...")
    import subprocess
    import sys
    subprocess.check_call([sys.executable, "-m", "pip", "install", "Pillow"])
    print("Please run this script again after installation.")
except Exception as e:
    print(f"Error creating icons: {e}")
    print("\nAlternative: Use online tools like:")
    print("1. https://www.appicon.co/")
    print("2. https://icon.kitchen/")
    print("3. Or manually convert the SVG file using Inkscape or similar tools")
