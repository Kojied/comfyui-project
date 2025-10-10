# ComfyUI Installation Guide for MacBook M1 (Apple Silicon)

Here is a step-by-step guide to install ComfyUI on a MacBook with an M1 chip (Apple Silicon). This workflow uses Python with Metal (MPS) acceleration and is compatible with macOS 12.3+ (Monterey or higher), Python 3.10–3.12, and leverages Homebrew for package management.[1][2][3][4]

## Prerequisites

- A MacBook with M1 (Apple Silicon) running macOS 12.3 or newer.[2][1]
- At least 8GB RAM (16GB+ recommended).[2]
- Basic familiarity with Terminal.

***

## Step 1: Install Homebrew

Open Terminal (search for "Terminal" in Spotlight). Then, install Homebrew by running:

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

***

## Step 2: Install Required Packages

Install essential build tools, Python (3.10+), and Git:

```sh
brew install cmake protobuf rust python@3.11 git wget
```
(You may use python@3.10 or 3.12 if you prefer.)
[1][3][2]

***

## Step 3: Clone the ComfyUI Repository

Navigate to your ComfyUI project directory in Terminal, then run:

```sh
git clone https://github.com/comfyanonymous/ComfyUI.git .
```

This will download all ComfyUI files directly into your current project directory.

***

## Step 4 (Recommended): Set up a Virtual Environment

This keeps dependencies isolated:

```sh
python3 -m venv venv
source venv/bin/activate
```

***

## Step 5: Install PyTorch (with MPS support)

Within the ComfyUI directory and active virtualenv, install PyTorch for Apple Silicon:

```sh
pip install torch torchvision torchaudio
```

For the latest stable versions with MPS support: 
Check the official instructions at https://pytorch.org/get-started/locally/ if you encounter issues.

***

## Step 6: Install ComfyUI Dependencies

In the same terminal:

```sh
pip install -r requirements.txt
```

***

## Step 7: Download a Stable Diffusion Model

You'll need a model to generate images. Download the SD v1.5 model (for example):

```sh
mkdir -p models/checkpoints
wget -P models/checkpoints https://huggingface.co/runwayml/stable-diffusion-v1-5/resolve/main/v1-5-pruned-emaonly.ckpt
```

***

## Step 8: Run ComfyUI

Start ComfyUI with:

```sh
python main.py
```
or, if using a virtual environment not activated:

```sh
./venv/bin/python main.py
```

Open your browser and navigate to http://127.0.0.1:8188/ to use the interface.

***

## Additional Notes

- For easier updating, run `git pull` to update ComfyUI.[1]
- Some community scripts automate most steps, but the above is the most reliable manual method.[5]
- All ComfyUI files will be downloaded directly into your project repository root directory.

***

Follow these steps to get ComfyUI running on your M1 Mac. This method gives you maximum flexibility for extensions, custom nodes, or add-ons.[4][3][2][1]

## References

[1](https://stable-diffusion-art.com/how-to-install-comfyui/)
[2](https://rogue-scholar.org/records/nfaaw-8r105)
[3](https://www.youtube.com/watch?v=tsHU1fOncTo)
[4](https://comfyui-wiki.com/en/install/install-comfyui/install-comfyui-on-mac)
[5](https://allabout.network/blogs/ddt/ai/complete-guide-to-comfyui-on-mac-installation-configuration-and-troubleshooting)
[6](https://www.youtube.com/watch?v=7zy5agctXsQ)
[7](https://www.youtube.com/watch?v=m9jg1fdOiVY)
[8](https://www.reddit.com/r/StableDiffusion/comments/1506nfu/how_do_i_install_comfyui_on_a_mac/)
[9](https://www.comfy.org/download)
[10](https://www.youtube.com/watch?v=R4OjXE6LKXY)
[11](https://dicksonc.com/how-to-install-comfyui-on-macos-with-apple-mac-silicon-m1-or-m2/)
[12](https://docs.comfy.org/installation/desktop/macos)
[13](https://www.reddit.com/r/comfyui/comments/1lorbut/how_to_setup_comfyui_for_macbook_apple_silicon/)
[14](https://github.com/comfyanonymous/ComfyUI/discussions/3283)
[15](https://www.beam.cloud/blog/how-to-install-comfyui)
[16](https://www.reddit.com/r/comfyui/comments/1jhkkn8/advice_apple_m1_max_64gb_comfy_ui_wan_21_14b/)
