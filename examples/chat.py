# Default example model: gpt-6.1-sol. Copy the exact model ID from the console model list.
# Another currently live model ID is: gpt-6-astro
import os
from openai import OpenAI

api_key = os.environ.get("NICEAI_API_KEY")
if not api_key:
    raise SystemExit("Set NICEAI_API_KEY")

client = OpenAI(
    api_key=api_key,
    base_url=os.environ.get("NICEAI_BASE_URL", "https://api.niceai.dev/v1"),
)

stream = os.environ.get("NICEAI_STREAM", "0") == "1"
kwargs = dict(
    model=os.environ.get("NICEAI_MODEL", "gpt-6.1-sol"),
    messages=[{"role": "user", "content": "Reply with the word pong."}],
)
if stream:
    for event in client.chat.completions.create(stream=True, **kwargs):
        delta = event.choices[0].delta.content or ""
        print(delta, end="", flush=True)
    print()
else:
    resp = client.chat.completions.create(**kwargs)
    print(resp.choices[0].message.content)
