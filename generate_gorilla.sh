#!/bin/bash
# Generate gorilla playing squash image

echo "🦍 Generating gorilla playing squash image..."

# Replace YOUR_NGROK_URL with your actual Colab ngrok URL
COLAB_URL="YOUR_NGROK_URL"

if [ "$COLAB_URL" = "YOUR_NGROK_URL" ]; then
    echo "❌ Please update the COLAB_URL variable with your actual ngrok URL"
    echo "📋 Steps:"
    echo "1. Upload comfyui_auth_colab.ipynb to Google Colab"
    echo "2. Run all cells"
    echo "3. Copy the ngrok URL"
    echo "4. Update COLAB_URL in this script"
    echo "5. Run: ./generate_gorilla.sh"
    exit 1
fi

echo "🔍 Checking ComfyUI status..."
python3 colab_simple.py --url "$COLAB_URL" --status

echo ""
echo "🎨 Queuing gorilla image generation..."
python3 colab_simple.py --url "$COLAB_URL" --queue "A gorilla playing squash, athletic pose, detailed fur, intense focus, photorealistic" --seed 789

echo ""
echo "⏳ Waiting for generation..."
sleep 30

echo "📥 Getting results..."
python3 colab_simple.py --url "$COLAB_URL" --results $(python3 -c "import json; print('PROMPT_ID_HERE')")  # This will need the actual prompt ID

echo "🎉 Gorilla image generation complete!"
