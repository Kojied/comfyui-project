#!/bin/bash
# Test script for ComfyUI Colab CLI

echo "🧪 ComfyUI Colab CLI Test Script"
echo "================================"

# Check if files exist
echo "📁 Checking files..."
if [ -f "comfyui_direct_colab.ipynb" ]; then
    echo "✅ Colab notebook created"
else
    echo "❌ Colab notebook missing"
fi

if [ -f "colab_direct.py" ]; then
    echo "✅ CLI script created"
else
    echo "❌ CLI script missing"
fi

if [ -f "user/default/workflows/flux_lora_tutorial_workflow.json" ]; then
    echo "✅ Workflow file found"
else
    echo "❌ Workflow file missing"
fi

echo ""
echo "🔧 Testing CLI help..."
python3 colab_direct.py --help

echo ""
echo "📋 Ready to use! Next steps:"
echo "1. Upload comfyui_direct_colab.ipynb to Google Colab"
echo "2. Run all cells"
echo "3. Copy the ngrok URL"
echo "4. Test with: python3 colab_direct.py --url YOUR_URL --status"
