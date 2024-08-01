local default_chat_system_prompt = "You are a general AI assistant.\n\n"
	.. "The user provided the additional info about how they would like you to respond:\n\n"
	.. "- If you're unsure don't guess and say you don't know instead.\n"
	.. "- Ask question if you need clarification to provide better answer.\n"
	.. "- Think deeply and carefully from first principles step by step.\n"
	.. "- Zoom out first to see the big picture and then zoom in to details.\n"
	.. "- Use Socratic method to improve your thinking and coding skills.\n"
	.. "- Don't elide any code from your output if the answer requires coding.\n"
	.. "- Take a deep breath; You've got this!\n"

local default_code_system_prompt = "You are an AI working as a code editor.\n\n"
	.. "Please AVOID COMMENTARY OUTSIDE OF THE SNIPPET RESPONSE.\n"
	.. "START AND END YOUR ANSWER WITH:\n\n```"

local config = {
	providers = {
		openai = {
			disable = false,
			endpoint = "https://api.openai.com/v1/chat/completions",
			secret = os.getenv("OPENAI_API_KEY"),
		},
		azure = {
			disable = true,
			endpoint = "https://$URL.openai.azure.com/openai/deployments/{{model}}/chat/completions",
			secret = os.getenv("AZURE_API_KEY"),
		},
		pplx = {
			disable = false,
			endpoint = "https://api.perplexity.ai/chat/completions",
			secret = os.getenv("PPLX_API_KEY"),
		},
		anthropic = {
			disable = false,
			endpoint = "https://api.anthropic.com/v1/messages",
			secret = os.getenv("ANTHROPIC_API_KEY"),
		},
		openrouter = {
			disable = false,
			endpoint = "https://openrouter.ai/api/v1/chat/completions",
			secret = os.getenv("OPENROUTER_API_KEY"),
		},
	},

	agents = {
		{
			name = "ChatGPT",
			disable = true,
		},
		{
			provider = "openai",
			name = "ChatGPT4o",
			chat = true,
			command = false,
			model = { model = "gpt-4o", temperature = 1.1, top_p = 1 },
			system_prompt = default_chat_system_prompt,
		},
		{
			provider = "openai",
			name = "ChatGPTMini",
			chat = true,
			command = false,
			model = { model = "gpt-4o-mini", temperature = 1.1, top_p = 1 },
			system_prompt = default_chat_system_prompt,
		},
		{
			provider = "pplx",
			name = "ChatPerplexityLlama",
			chat = true,
			command = false,
			model = { model = "llama-3.1-sonar-large-128k-chat", temperature = 1.1, top_p = 1 },
			system_prompt = default_chat_system_prompt,
		},
		{
			provider = "pplx",
			name = "ChatPerplexityOnline",
			chat = true,
			command = false,
			model = { model = "llama-3.1-sonar-large-128k-online", temperature = 1.1, top_p = 1 },
			system_prompt = default_chat_system_prompt,
		},
		{
			provider = "anthropic",
			name = "ChatClaude-3-5-Sonnet",
			chat = true,
			command = false,
			model = { model = "claude-3-5-sonnet-20240620", temperature = 0.8, top_p = 1 },
			system_prompt = default_chat_system_prompt,
		},
		{
			provider = "openrouter",
			name = "ChatDeepseek",
			chat = true,
			command = false,
			model = { model = "deepseek/deepseek-chat", temperature = 1.1, top_p = 1 },
			system_prompt = default_chat_system_prompt,
		},
		{
			provider = "openai",
			name = "CodeGPT4o",
			chat = false,
			command = true,
			model = { model = "gpt-4o", temperature = 0.8, top_p = 1 },
			system_prompt = default_code_system_prompt,
		},
		{
			provider = "openai",
			name = "CodeGPTMini",
			chat = false,
			command = true,
			model = { model = "gpt-4o-mini", temperature = 0.8, top_p = 1 },
			system_prompt = default_code_system_prompt,
		},
		{
			provider = "pplx",
			name = "CodePerplexityLlama",
			chat = false,
			command = true,
			model = { model = "llama-3.1-70b-instruct", temperature = 0.8, top_p = 1 },
			system_prompt = default_code_system_prompt,
		},
		{
			provider = "pplx",
			name = "CodePerplexityOnline",
			chat = false,
			command = true,
			model = { model = "llama-3.1-sonar-large-128k-online", temperature = 0.8, top_p = 1 },
			system_prompt = default_code_system_prompt,
		},
		{
			provider = "anthropic",
			name = "CodeClaude-3-5-Sonnet",
			chat = false,
			command = true,
			model = { model = "claude-3-5-sonnet-20240620", temperature = 0.8, top_p = 1 },
			system_prompt = default_code_system_prompt,
		},
		{
			provider = "openrouter",
			name = "CodeDeepseek",
			chat = false,
			command = true,
			model = { model = "deepseek/deepseek-coder", temperature = 0.8, top_p = 1 },
			system_prompt = default_code_system_prompt,
		},
	},

	hooks = {
		Implement = function(gp, params)
			local template = "Having following from {{filename}}:\n\n"
				.. "```{{filetype}}\n{{selection}}\n```\n\n"
				.. "Please rewrite this according to the contained instructions."
				.. "\n\nRespond exclusively with the snippet that should replace the selection above."

			local agent = gp.get_command_agent()
			gp.info("Implementing selection with agent: " .. agent.name)

			gp.Prompt(
				params,
				gp.Target.rewrite,
				nil, -- command will run directly without any prompting for user input
				agent.model,
				template,
				agent.system_prompt
			)
		end,

		UnitTests = function(gp, params)
			local template = "I have the following code from {{filename}}:\n\n"
				.. "```{{filetype}}\n{{selection}}\n```\n\n"
				.. "Please respond by writing table driven unit tests for the code above."
			local agent = gp.get_command_agent()
			gp.Prompt(params, gp.Target.vnew, agent, template)
		end,

		Explain = function(gp, params)
			local template = "I have the following code from {{filename}}:\n\n"
				.. "```{{filetype}}\n{{selection}}\n```\n\n"
				.. "Please respond by explaining the code above."
			local agent = gp.get_chat_agent()
			gp.Prompt(params, gp.Target.popup, agent, template)
		end,

		CodeReview = function(gp, params)
			local template = "I have the following code from {{filename}}:\n\n"
				.. "```{{filetype}}\n{{selection}}\n```\n\n"
				.. "Please analyze for code smells and suggest improvements."
			local agent = gp.get_chat_agent()
			gp.Prompt(params, gp.Target.enew("markdown"), agent, template)
		end,

		Translator = function(gp, params)
			local chat_system_prompt = "You are a Translator, please translate between English and Chinese."
			gp.cmd.ChatNew(params, chat_system_prompt)

			-- -- you can also create a chat with a specific fixed agent like this:
			-- local agent = gp.get_chat_agent("ChatGPT4o")
			-- gp.cmd.ChatNew(params, chat_system_prompt, agent)
		end,

		BufferChatNew = function(gp, _)
			-- call GpChatNew command in range mode on whole buffer
			vim.api.nvim_command("%" .. gp.config.cmd_prefix .. "ChatNew")
		end,
	},

	toggle_target = "popup",
}

require("gp").setup(config)
