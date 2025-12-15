# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.0-base

# install custom nodes into comfyui
RUN comfy node install --exit-on-fail \
    comfyui-easy-use@1.3.4 \
    ComfyUI-VideoHelperSuite \
    ComfyUI-WanVideoWrapper

# download models into comfyui
RUN comfy model download \
    --url "https://huggingface.co/Phr00t/Qwen-Image-Edit-Rapid-AIO/resolve/main/v11/Qwen-Rapid-AIO-NSFW-v11.4.safetensors?download=true" \
    --relative-path models/checkpoints \
    --filename Qwen-Rapid-AIO-NSFW-v11.4.safetensors \
 && comfy model download \
    --url "https://huggingface.co/Phr00t/WAN2.2-14B-Rapid-AllInOne/resolve/main/Mega-v12/wan2.2-rapid-mega-aio-nsfw-v12.1.safetensors?download=true" \
    --relative-path models/checkpoints \
    --filename wan2.2-rapid-mega-aio-nsfw-v12.1.safetensors

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
