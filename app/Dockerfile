FROM vllm/vllm-openai:gemma4

LABEL maintainer="Manik Singhal"

RUN useradd -m -u 1000 appuser

USER appuser

EXPOSE 8000

CMD ["--model", "google/gemma-4-E2B"]