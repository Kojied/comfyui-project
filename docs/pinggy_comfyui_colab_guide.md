# Run and Share ComfyUI on Google Colab with Pinggy - Complete Guide

*Based on the official Pinggy tutorial for ComfyUI*

## Overview

This guide shows you how to run ComfyUI on Google Colab with GPU acceleration and create public URLs using Pinggy's tunneling service. This setup allows you to access ComfyUI from anywhere in the world without expensive hardware.

## Why This Setup?

- **Free GPU Access**: Google Colab provides Tesla T4 GPUs with 15GB VRAM
- **No Local Setup**: No need for expensive hardware or CUDA drivers
- **Public Access**: Pinggy creates public URLs accessible from anywhere
- **Cost Effective**: Perfect for artists, developers, and researchers

## Prerequisites

- Google Colab account
- **CRITICAL**: Must enable GPU runtime (Runtime > Change runtime type > GPU)

## Step-by-Step Setup

### 1. Enable GPU Runtime (MANDATORY)

**This step cannot be skipped!** ComfyUI requires GPU acceleration to work properly.

1. In Colab, go to **Runtime > Change runtime type**
2. Select **GPU** as hardware accelerator
3. Click **Save**

### 2. Install System Dependencies

```python
# Install essential system packages
!apt-get update
!apt-get install -y wget aria2 libgl1-mesa-glx
```

### 3. Clone and Install ComfyUI

```python
# Clone ComfyUI repository
!git clone https://github.com/comfyanonymous/ComfyUI.git

# Navigate to ComfyUI directory
%cd ComfyUI

# Install Python dependencies
!pip install -r requirements.txt
```

### 4. Install Pinggy Tunneling Service

```python
# Install Pinggy Python package
!pip install pinggy
```

### 5. Create Public Tunnel

```python
import pinggy

# Create tunnel to forward traffic to ComfyUI
tunnel1 = pinggy.start_tunnel(
    forwardto="localhost:8188",
)

print(f"Tunnel started - URLs: {tunnel1.urls}")
```

This creates both HTTP and HTTPS endpoints that anyone can access. URLs will look like:
- `https://randomstring.a.free.pinggy.link`

### 6. Launch ComfyUI Server

```python
# Start ComfyUI server (must use --listen 0.0.0.0)
!python main.py --listen 0.0.0.0
```

### 7. Access ComfyUI

Use the Pinggy URL from step 5 to access ComfyUI from any browser, anywhere in the world.

## Complete Working Code

Here's the complete setup in one cell:

```python
# Complete ComfyUI + Pinggy Setup
import pinggy

# 1. Install system dependencies
!apt-get update
!apt-get install -y wget aria2 libgl1-mesa-glx

# 2. Clone ComfyUI
!git clone https://github.com/comfyanonymous/ComfyUI.git

# 3. Install ComfyUI requirements
%cd ComfyUI
!pip install -r requirements.txt

# 4. Install Pinggy
!pip install pinggy

# 5. Create tunnel
tunnel1 = pinggy.start_tunnel(forwardto="localhost:8188")
print(f"🌐 ComfyUI will be accessible at: {tunnel1.urls}")

# 6. Start ComfyUI server
!python main.py --listen 0.0.0.0
```

## Performance Expectations

### Free Tier Limitations
- **Loading Time**: 5-10 minutes for ComfyUI to fully load
- **Session Limits**: Sessions may disconnect after inactivity
- **GPU Speed**: Slower than high-end GPUs (RTX 4090, A100)
- **Work Lost**: Save important workflows/images before session ends

### Colab Pro Benefits
- Faster GPUs (A100, V100)
- Longer session times
- Priority resource access
- Better performance for complex workflows

## Troubleshooting

### Common Issues and Solutions

1. **GPU Not Detected**
   - Verify GPU runtime is enabled
   - Restart Colab session
   - May take multiple attempts on free tier

2. **Out of Memory Errors**
   - T4 has 15GB VRAM - should handle most workflows
   - Try smaller models or reduce batch sizes
   - Check workflow complexity

3. **Slow Loading**
   - 5-10 minute load time is normal on free tier
   - Don't refresh page during startup
   - Wait for all components to load

4. **Tunnel Connection Issues**
   - Verify tunnel is still active
   - Check ComfyUI is running on port 8188
   - Restart tunnel if necessary

5. **ComfyUI Won't Start**
   - Ensure GPU runtime is enabled
   - Check all dependencies installed
   - Verify `--listen 0.0.0.0` parameter

## Advanced Usage

### Downloading Models

```python
# Download Stable Diffusion models
!wget -O models/checkpoints/sd_model.safetensors "https://huggingface.co/runwayml/stable-diffusion-v1-5/resolve/main/v1-5-pruned-emaonly.safetensors"
```

### Custom Workflows

1. Load your workflow JSON in ComfyUI
2. Use the Pinggy URL to access from anywhere
3. Share URLs with collaborators

### Saving Generated Images

- Images are saved in ComfyUI's output folder
- Download from Colab's file browser
- Or use ComfyUI's built-in download features

## Security Considerations

- Pinggy URLs are public - anyone with the URL can access your ComfyUI
- Don't run sensitive workflows on public URLs
- Consider authentication for production use

## Next Steps

1. **Test Basic Workflow**: Try simple text-to-image generation
2. **Load Custom Models**: Download and test different models
3. **Share with Others**: Use Pinggy URLs to collaborate
4. **Upgrade if Needed**: Consider Colab Pro for regular use

## Resources

- **Official Pinggy Tutorial**: [Run and Share ComfyUI on Google Colab](https://pinggy.io/blog/run_and_share_comfyui_on_google_colab/)
- **ComfyUI GitHub**: https://github.com/comfyanonymous/ComfyUI
- **Pinggy Documentation**: https://pinggy.io/docs

## Summary

This setup provides a powerful, free way to run ComfyUI with GPU acceleration and public access. While the free tier has limitations, it's perfect for experimentation, learning, and sharing AI-generated art without expensive hardware investments.

**Key Benefits:**
- ✅ Free GPU access via Google Colab
- ✅ Public URLs via Pinggy tunneling
- ✅ No local hardware requirements
- ✅ Accessible from anywhere
- ✅ Perfect for learning and experimentation

**Remember:** Always enable GPU runtime first, and be patient with loading times on the free tier!
