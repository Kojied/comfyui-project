# How to Use Flux LoRA's in ComfyUI: A Complete Walkthrough

*Based on Next Diffusion Tutorial - June 15, 2025*

## Table of Contents
1. [Introduction](#introduction)
2. [What Are LoRA Models and Why Use Them with Flux Dev?](#what-are-lora-models-and-why-use-them-with-flux-dev)
3. [Requirements: Running Flux Dev LoRA Workflow](#requirements-running-flux-dev-lora-workflow)
4. [Setting Up Flux Dev FP8 LoRA Workflow in ComfyUI](#setting-up-flux-dev-fp8-lora-workflow-in-comfyui)
5. [How to Find Flux-Compatible LoRAs on Civitai](#how-to-find-flux-compatible-loras-on-civitai)
6. [How to Install Flux-Compatible LoRAs in ComfyUI](#how-to-install-flux-compatible-loras-in-comfyui)
7. [Running Your First Flux Dev LoRA Generation](#running-your-first-flux-dev-lora-generation)
8. [Exploring the Power LoRA Loader Node](#exploring-the-power-lora-loader-node)
9. [Fine-Tuning Realism with Multiple LoRAs](#fine-tuning-realism-with-multiple-loras)
10. [Bonus: Flux Dev GGUF LoRA Workflow Setup (Lower VRAM)](#bonus-flux-dev-gguf-lora-workflow-setup-lower-vram)
11. [Conclusion](#conclusion)

## Introduction

In this tutorial, you'll learn how to harness the full potential of Flux LoRA within ComfyUI — a powerful, node-based interface for AI image and video generation. Flux is a cutting-edge diffusion model known for producing highly realistic, prompt-accurate results. But when you need more stylized, artistic, or character-specific outcomes, that's where LoRA (Low-Rank Adaptation) models shine.

This guide will show you how to combine the Flux Dev base model with one or more LoRAs to enhance image generation, explore new styles, and gain fine-grained control over your outputs. We'll dive into loading LoRAs, stacking multiple models, adjusting strengths, previewing outputs, and even where to find the best LoRAs online.

## What Are LoRA Models and Why Use Them with Flux Dev?

LoRA, or Low-Rank Adaptation, is a technique used to fine-tune large diffusion models like Flux Dev without retraining them from scratch. Rather than modifying the entire base model, a LoRA acts like a lightweight "style patch" — applying targeted changes that shift the style, content, or structure of the generated image.

### Why use LoRAs with Flux Dev?

Because while Flux excels at photorealistic, prompt-accurate generation, it isn't always the most imaginative model out of the box. LoRAs fill that creative gap by letting you:

- **Stylize your images** with a particular art direction
- **Recreate consistent characters** or facial features
- **Change clothing, body types, or poses**
- **Inject specific environments or themes** into a scene

LoRAs don't replace your base model — they enhance it. You can fine-tune how much each LoRA influences the output, and because they're modular, you can experiment freely without needing to bake changes into the model itself.

## Requirements: Running Flux Dev LoRA Workflow

Before we dive into generating images with Flux Dev and LoRAs inside ComfyUI, you'll need to set up your environment with the correct model version and files. For this guide, we'll start with the Flux Dev FP8 version — our recommended starting point for its excellent image quality, high performance, and straightforward setup inside ComfyUI.

### 1. Install ComfyUI

Flux Dev runs inside ComfyUI, a flexible and powerful node-based interface for AI image generation.

If you haven't installed it yet, choose the setup that fits your system:

- **Local Installation**: Ideal for users with a PC or workstation (12GB+ VRAM recommended)
- **RunPod Deployment**: Perfect for cloud-based GPU access with minimal local setup

### 2. Download the Required Files

To run Flux Dev FP8 in ComfyUI, you'll need to manually download and place the following files. These are not bundled with ComfyUI by default.

**Flux Dev FP8 Model Checkpoint**
- 🔗 Download: `flux_dev_fp8.safetensors`
- 📁 Save to: `ComfyUI/models/checkpoints/`

### 3. Verify Your Folder Structure

After downloading and placing the files, your directory should look like this:

```
📂 ComfyUI/
├── 📂 models/
│   └── 📂 checkpoints/
│       └── flux_dev_fp8.safetensors
```

## Setting Up Flux Dev FP8 LoRA Workflow in ComfyUI

Now that your environment and model files are in place, it's time to load and configure the Flux Dev FP8 LoRA workflow in ComfyUI.

### 1. Load the Flux Dev LoRA Workflow

Start by loading the pre-built Flux Dev FP8 LoRA workflow:

👉 Download the provided Flux Dev FP8 LoRA Workflow JSON file and drag it into your ComfyUI canvas.

This workflow template includes all required nodes for Flux Dev with LoRA support, pre-arranged for easy customization and immediate testing.

### 2. Installing Missing Nodes for Flux Dev LoRA Workflow

When you load the Flux Dev LoRA workflow, you may see red nodes — this means some custom nodes are missing. In this case, we need to install the Power Lora Loader (rgthree) node.

Follow these quick steps:

1. Click the **Manager** button (top right)
2. Click **Install missing custom nodes** — ComfyUI will scan for any missing nodes
3. In the list, search for `rgthree-comfy` and click **Install**
4. Click **Restart** (bottom left), confirm the restart, and wait for reconnection
5. Once reconnected, refresh your browser tab

That's it — your workflow is now fully ready for LoRA stacking.

### Where Do Flux LoRAs Get Loaded?

With the Power Lora Loader node now installed, you'll see a dedicated node inside your workflow where LoRAs can be added. This node allows you to:

- Load multiple LoRAs at once
- Adjust individual strengths
- Stack LoRAs together for more advanced combinations

## How to Find Flux-Compatible LoRAs on Civitai

To start using LoRAs with Flux Dev in ComfyUI, your first step is discovering the right LoRA models. The best source for this is Civitai and depending on how you browse, there are two different filter systems to be aware of.

### Option 1: Using the Main Models Page

If you go directly to the Models page on Civitai, click the filter icon in the top-right corner. Then set the following options:

- **Time Period**: All Time
- **Model Types**: LoRA
- **Base Model**: Flux.1 D

This will give you a curated list of all the LoRAs specifically trained for Flux Dev — no guesswork required.

### Option 2: Using the Search Bar (with Sidebar Filters)

If you use the search bar instead — for example, typing in "fantasy" or "anime" — make sure to refine your results using the sidebar filters that appear on the left:

- **Base Model**: Select Flux.1 Dev
- **Model Type**: Select LoRA

⚠️ **Without these filters, your results might show LoRAs trained on completely different base models (like SDXL), which may not work properly with Flux Dev in ComfyUI.**

## How to Install Flux-Compatible LoRAs in ComfyUI

Now that you know how to search for Flux-compatible LoRAs on Civitai, let's walk through the full process of installing and preparing one for use inside ComfyUI with Flux Dev.

For this example, we'll use the **Cyberpunk Anime Style LoRA**, which gives your generations a vibrant neon sci-fi or anime look.

### Step 1: Open the LoRA's Page

Once you've found a LoRA you want to try — like Cyberpunk Anime Style — click into its individual model page on Civitai. This page contains everything you need to properly install and use the LoRA.

### Step 2: Check for Trigger Words

Almost every LoRA comes with one or more trigger words — special terms you need to include in your prompt to activate the LoRA's style effect. If you forget these, the LoRA may technically load, but your image will simply fall back to Flux Dev's native photorealism.

You can usually find the trigger words:

- In the model details section
- Embedded inside example prompts
- In comments or notes from the creator or other users

💡 **Example for Cyberpunk Anime Style:**

This LoRA uses the trigger words:
- `anime`
- `cyberpunk`

You can include either word individually or both together for a hybrid effect. If you skip these trigger words, the LoRA will have no visible impact — even though it technically loaded into ComfyUI.

### Step 3: Download the LoRA and Place It in Your LoRA Folder

1. Click the **Download** button on the LoRA's Civitai page to get the `.safetensors` file
2. Before moving it into ComfyUI, you can rename the file to anything you like — just make sure it's a unique, simple name you can easily remember and identify later
3. For this example, we'll name the file: `CyberpunkAnime.safetensors`

```
📂 ComfyUI/
└── 📂 models/
    └── 📂 loras/
        └── CyberpunkAnime.safetensors
```

This step ensures the LoRA will be recognized by ComfyUI the next time it starts or reloads.

## Running Your First Flux Dev LoRA Generation

Now that your workflow is fully prepared, it's time to load your LoRA, enter the trigger words, and run your first generation.

### Step 1 — Load the LoRA in the Power LoRA Loader Node

Inside your loaded workflow, locate the Power LoRA Loader (rgthree) node.

1. Click on the node
2. In the dropdown list, select your downloaded LoRA — in this case: `CyberpunkAnime.safetensors`
3. Leave the strength at 1.0 for now (you can adjust it later to fine-tune the effect)

### Step 2 — Enter the Trigger Word in the Positive Prompt

Simply selecting the LoRA doesn't apply its effect automatically — you must still include the correct trigger word in your positive prompt. For this LoRA, you can use either `anime` or `cyberpunk` as trigger words, depending on which style you want to apply to your generation.

#### Examples — Anime Style Activation

**Anime Example 1**
```
Prompt: anime, busty woman with fiery red hair styled in loose curls, wearing a low-cut white blouse partially unbuttoned, sitting against a backdrop of swirling smoke and floating neon butterflies. The lighting is warm, almost candlelit, enhancing her soft skin and inviting gaze.
```

**Anime Example 2**
```
Prompt: anime, a confident woman with long dark hair in a high ponytail stands mid-action in a cyber dojo, her exposed cleavage framed by a red and black futuristic martial arts outfit. Thick smoke curls from glowing incense burners and neon signs flicker in the background. Her eyes blaze with intensity as she looks at the viewer.
```

#### Examples — Cyberpunk Style Activation

**Cyberpunk Example 1**
```
Prompt: Cyberpunk, hyperrealistic ultra-busty woman floats in a holographic chamber, nude but covered strategically by glowing data ribbons wrapping tightly around her massive chest and wide hips. Her long platinum hair floats freely in zero gravity. Her glowing pink eyes stare directly at the viewer with a soft, seductive expression. Holographic energy pulses around her, with hyper-detailed skin pores, soft glows, and floating particles creating an extremely intimate, sensual sci-fi atmosphere.
```

**Cyberpunk Example 2**
```
Prompt: Cyberpunk, hyperrealistic busty woman lounges inside a luxury floating capsule, wrapped loosely in a shimmering nanofiber robe slipping off her shoulders, revealing her large bare breasts partially concealed by glowing circuit tattoos. Her silver hair is styled into sleek twin ponytails, and her teal eyes focus on the viewer with a gentle smirk. Surrounding her, glowing data streams and holographic UI panels create an intimate, high-end sci-fi atmosphere.
```

⚡ **Note**: All examples above rendered at 1280x720, 30 steps, ~20 seconds on RTX 4090.

## Exploring the Power LoRA Loader Node

With your workflow ready, let's take a closer look at the Power LoRA Loader node itself — the core of how we stack and manage LoRAs inside ComfyUI for Flux Dev.

### 1. Adding and Adjusting LoRA Strength

Inside the Power LoRA Loader node, you'll see an input field next to each loaded LoRA labeled **Strength**:

- The strength value typically ranges from **0.0 to 1.0**
- **0.0** means the LoRA has no effect (essentially disabled)
- **1.0** means the LoRA is fully applied at its maximum trained strength
- You can enter any value between these to fine-tune the influence

When stacking multiple LoRAs, it's generally recommended to lower each strength slightly (e.g. 0.5, 0.6, 0.7), as applying all at full strength can sometimes lead to overbaked or conflicting results.

### 2. Viewing LoRA Details and Trigger Words

A very useful feature:

1. **Right-click** on any loaded LoRA inside the node and select **Show Info**
2. A popup window will appear with detailed information about the LoRA
3. In this window, you'll find a **Fetch From Civitai** button
4. Click this, and the node will automatically pull metadata directly from Civitai
5. You'll see where the LoRA was trained, its base model, example images, and most importantly: the recommended trigger words / trained words

If you're unsure which trigger words to use, simply select the word from the list, then click **Copy** next to the suggested tags (found under the trained words on the left). You can then paste them directly into your positive prompt.

## Fine-Tuning Realism with Multiple LoRAs

Now that you've learned how to load and apply a single LoRA, it's time to explore how combining multiple LoRAs can give you far greater creative control and realism. By stacking LoRAs, you can tweak different aspects of your image—from body shape to stylistic effects—to craft exactly the look you want.

For this example, we'll use three complementary LoRAs:

### Recommended LoRA Combination

1. **Flux Skinny Petite**
   - 🔗 [Civitai Link]
   - **Trigger Word**: `skinny`
   - **Effect**: Slims down the body shape to a petite, slender frame

2. **SamsungCam UltraReal**
   - 🔗 [Civitai Link]
   - **Trigger Word**: `s2ms8ng`
   - **Effect**: Adds a natural, ultra-realistic phone-camera aesthetic, enhancing lighting and texture

3. **Flux Bolt-Ons (High Profile Breast Implants)**
   - 🔗 [Civitai Link]
   - **Trigger Word**: `b0lt0ns`
   - **Effect**: Creates the look of lifted, enhanced breasts, adding sensual volume and shape

### Setting Up Multiple LoRAs in ComfyUI

To stack multiple LoRAs:

1. Select all three models within your Power LoRA node
2. Adjust their strength values in the input fields, usually between 0 and 1
3. For the best, most natural results, avoid setting all strengths to 1, as this can cause visual artifacts
4. Instead, slightly lower each value—around **0.6 to 0.8**—when stacking
5. Don't forget to include all three corresponding trigger words (`skinny`, `s2ms8ng`, and `b0lt0ns`) at the start of your positive prompt to activate each LoRA properly

With these examples, you've seen firsthand how stacking multiple LoRAs can elevate your images beyond what a single LoRA can achieve. By combining body shape modifiers, stylistic enhancements, and specific feature augmentations, you gain fine control over the aesthetics and realism of your creations.

## Bonus: Flux Dev GGUF LoRA Workflow Setup (Lower VRAM)

If you have limited VRAM, Flux Dev offers GGUF model versions optimized for lower-resource setups. These versions come in different quantization levels (QX), where higher Q values require more VRAM. As a rule of thumb, the GGUF model file size (in GB) roughly corresponds to the VRAM needed to run it.

You can browse and download the right GGUF model version for your system from the official Flux Dev repository on Huggingface, selecting a balance between performance and quality based on your hardware.

### Required Files and Their Locations

| Model/File Name | Folder Path | Download Link |
|----------------|-------------|---------------|
| flux1-dev-QX.gguf | ComfyUI/models/diffusion_models | 🤗 Flux Dev GGUF Models |
| t5-v1_1-xxl-encoder-QX.gguf | ComfyUI/models/clip | 🤗 Corresponding Encoder GGUF Models |
| clip_l.safetensors | ComfyUI/models/clip | 🤗 Clip Models |
| ae.safetensors | ComfyUI/models/vae | 🤗 VAE Models |

### Example Folder Structure

```
ComfyUI/
├── 📁 models/
│   ├── 📁 diffusion_models/
│   │   └── flux1-dev-QX.gguf
│   ├── 📁 clip/
│   │   ├── t5-v1_1-xxl-encoder-QX.gguf
│   │   └── clip_l.safetensors
│   └── 📁 vae/
│       └── ae.safetensors
```

### Workflow Setup

👉 Download the provided Flux Dev FP8 LoRA Workflow JSON file and drag it into your ComfyUI canvas.

This workflow template includes all required nodes for Flux Dev with LoRA support, pre-arranged for easy customization and immediate testing.

## Conclusion

In conclusion, using Flux LoRA within ComfyUI unlocks a powerful and flexible approach to creating breathtaking AI-generated images. This tutorial has guided you through updating ComfyUI, loading workflows, downloading essential Flux and LoRA models, and effectively generating stunning visuals.

The true magic comes with experimentation—don't hesitate to explore different prompt styles, model combinations, and strength settings to find what best fits your unique creative vision. As you grow more comfortable with ComfyUI and Flux LoRA's capabilities, your skill to craft distinctive, captivating images will expand dramatically.

Whether you're an artist, designer, or AI art enthusiast, the knowledge gained here will be a valuable asset on your creative journey. Happy creating!

## Frequently Asked Questions

- **What is Flux LoRA and how does it enhance image generation in ComfyUI?**
- **How do I update ComfyUI before using Flux LoRA?**
- **Can I use multiple LoRA models simultaneously in ComfyUI?**

---

*This guide is based on the Next Diffusion tutorial from June 15, 2025. For the most up-to-date information and additional resources, visit the original tutorial source.*
