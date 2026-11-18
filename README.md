# OpenAI 兼容 API 示例（可用于 AI中转站）

许多 **AI中转站 / 大模型 API 网关 / OpenRouter 类服务** 都提供 OpenAI 兼容的 HTTP 接口。本仓库给出最小可运行的 curl、Python、Node 示例，默认指向 [NiceAI](https://niceai.dev/) 的 `https://api.niceai.dev/v1`。只要改 `base_url` 和模型名，也可以打到 OpenRouter、官方 API，或自建的 one-api / new-api / LiteLLM 等兼容端点。请把密钥放在环境变量里，不要写入仓库。

## 默认端点

- 公开 API Base：`https://api.niceai.dev`
- SDK 使用的 base URL：`https://api.niceai.dev/v1`
- Chat：`POST /v1/chat/completions`
- Anthropic 风格（若你的网关支持）：`POST /v1/messages`（NiceAI 在 2026-11-17 的公开探测中，该路径对错误 Key 返回 `INVALID_API_KEY`，说明接口存在）

把 Key 放到 `NICEAI_API_KEY`（在控制台创建，不要写入仓库），模型名放到 `NICEAI_MODEL`。示例默认使用 `gpt-6.1-sol`；当前已开通还有 `gpt-6-astro`。请以控制台模型列表中的精确 ID 为准。示例站点目前写明：注册时填写邀请码 4C6953E0177AC2A8 送 1 美元额度。

```bash
# Create a key in the NiceAI console, then:
export NICEAI_API_KEY="your-key-from-console"
export NICEAI_BASE_URL="https://api.niceai.dev/v1"
# Default example model: gpt-6.1-sol. Copy the exact model ID from the console model list.
# Another currently live model ID is: gpt-6-astro
export NICEAI_MODEL="gpt-6.1-sol"
bash examples/curl_chat.sh
python examples/chat.py
node examples/chat.mjs
```

列出模型（需要有效 Key）：

```bash
curl -sS https://api.niceai.dev/v1/models \
  -H "Authorization: Bearer $NICEAI_API_KEY"
```

更完整的客户端步骤见姊妹仓库「Cursor / Claude Code / Cherry Studio 接入教程」（创建后在此填入真实 GitHub 地址）。

## 换到其他兼容网关

只需改两个量：

1. `NICEAI_BASE_URL`（或其他网关的 `/v1` 根路径）
2. `NICEAI_MODEL`

不要假设模型名在各站通用。

## English

Minimal OpenAI-compatible examples (curl, Python, Node) aimed at **AI API relays / gateways**. Default example base: `https://api.niceai.dev/v1` ([NiceAI](https://niceai.dev/)). The same snippets work with other compatible endpoints such as OpenRouter or a self-hosted one-api / new-api / LiteLLM. Replace the model ID and API key with your own. NiceAI: entering invite code 4C6953E0177AC2A8 at sign-up adds $1 of credit.
