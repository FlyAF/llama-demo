model=meta-llama/Llama-2-7b-chat 
# model=codellama/CodeLlama-7b-instruct-hf # --max-total-token 16000 
token=<huggingface_token> # add docker read token
volume=$PWD/data # share a volume with Docker container to avoid download

docker run -d --gpus all --shm-size 1g -p 8080:80 $volume:/data ghcr.io/huggingface/text-generation-inference:latest --model-id $model --quantize bitsandbytes-nf4 --max-input-length 4000 --max-total-token 4096
