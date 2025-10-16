# ComfyUI Google Colab CLI Setup Guide

## 🚀 Quick Start

### 1. Upload to Google Colab
- Upload `comfyui_direct_colab.ipynb` to Google Colab
- Run all cells in the notebook
- Copy the ngrok URL (e.g., `https://abc123.ngrok.io`)

### 2. Use CLI Commands

```bash
# Check if ComfyUI is running
python3 colab_direct.py --url https://your-ngrok-url.ngrok.io --status

# Generate image with custom prompt
python3 colab_direct.py --url https://your-ngrok-url.ngrok.io --queue "A majestic tiger in a lush jungle"

# Generate with custom prompt and seed
python3 colab_direct.py --url https://your-ngrok-url.ngrok.io --queue "A beautiful sunset" --seed 12345

# Get results for a specific prompt ID
python3 colab_direct.py --url https://your-ngrok-url.ngrok.io --results PROMPT_ID

# Download an image
python3 colab_direct.py --url https://your-ngrok-url.ngrok.io --download "https://your-ngrok-url.ngrok.io/view?filename=image.png"
```

## 📋 Workflow Details

Your FLUX LoRA workflow includes:
- **Model**: FLUX1-dev
- **LoRA**: tiger_lora.safetensors (strength: 1.0)
- **Resolution**: 512x512
- **Steps**: 20
- **Sampler**: Euler
- **Scheduler**: Normal

## 🔧 Customization

The CLI automatically modifies:
- **Prompt**: Updates the CLIPTextEncode node
- **Seed**: Updates the RandomNoise node

## 📁 Files Created

- `comfyui_direct_colab.ipynb` - Colab notebook
- `colab_direct.py` - CLI interface
- `colab_cli.py` - Alternative CLI (more complex)

## ⚡ Tips

1. **Keep Colab running**: The notebook will stay active as long as you keep it open
2. **Check status first**: Always verify ComfyUI is running before queuing workflows
3. **Monitor results**: Use the results command to check if your image is ready
4. **Download images**: Images are saved to your Colab instance - use the download command to get them locally

## 🆘 Troubleshooting

- **Connection errors**: Make sure the ngrok URL is correct and Colab is running
- **Queue failures**: Check that ComfyUI has finished loading (wait 30+ seconds after startup)
- **No results**: The workflow might still be processing - wait a bit and check again
