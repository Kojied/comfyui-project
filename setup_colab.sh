#!/bin/bash
# ComfyUI Colab Setup Script

echo "🚀 ComfyUI Google Colab Setup"
echo "=============================="

# Create the Colab notebook
echo "📝 Creating Colab notebook..."
python3 colab_cli.py --create-notebook

echo ""
echo "📋 Next Steps:"
echo "1. Upload 'comfyui_flux_lora_colab.ipynb' to Google Colab"
echo "2. Run all cells in the notebook"
echo "3. Copy the Colab URL (it will look like: https://colab.research.google.com/drive/...) "
echo "4. Use the CLI commands below to control your workflow:"
echo ""
echo "🔧 CLI Commands:"
echo "  # Check if ComfyUI is running"
echo "  python3 colab_cli.py --colab-url YOUR_COLAB_URL --status"
echo ""
echo "  # Generate image with custom prompt"
echo "  python3 colab_cli.py --colab-url YOUR_COLAB_URL --queue 'A beautiful sunset over mountains'"
echo ""
echo "  # Generate with custom prompt and seed"
echo "  python3 colab_cli.py --colab-url YOUR_COLAB_URL --queue 'A majestic tiger' --seed 12345"
echo ""
echo "  # Get results"
echo "  python3 colab_cli.py --colab-url YOUR_COLAB_URL --results PROMPT_ID"
echo ""
echo "  # Download image"
echo "  python3 colab_cli.py --colab-url YOUR_COLAB_URL --download IMAGE_URL"
echo ""
echo "✅ Setup complete! Upload the notebook to Colab and start generating!"
