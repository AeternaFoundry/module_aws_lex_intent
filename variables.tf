variable "lex_intents" {
  description = <<EOT
Map of lex_intents, attributes below
Required:
    - name
    - fulfillment_activity (block):
        - code_hook (optional, block):
            - message_version (required)
            - uri (required)
        - type (required)
Optional:
    - create_version
    - description
    - parent_intent_signature
    - region
    - sample_utterances
    - conclusion_statement (block):
        - message (required, block):
            - content (required)
            - content_type (required)
            - group_number (optional)
        - response_card (optional)
    - confirmation_prompt (block):
        - max_attempts (required)
        - message (required, block):
            - content (required)
            - content_type (required)
            - group_number (optional)
        - response_card (optional)
    - dialog_code_hook (block):
        - message_version (required)
        - uri (required)
    - follow_up_prompt (block):
        - prompt (required, block):
            - max_attempts (required)
            - message (required, block):
                - content (required)
                - content_type (required)
                - group_number (optional)
            - response_card (optional)
        - rejection_statement (required, block):
            - message (required, block):
                - content (required)
                - content_type (required)
                - group_number (optional)
            - response_card (optional)
    - rejection_statement (block):
        - message (required, block):
            - content (required)
            - content_type (required)
            - group_number (optional)
        - response_card (optional)
    - slot (block):
        - description (optional)
        - name (required)
        - priority (optional)
        - response_card (optional)
        - sample_utterances (optional)
        - slot_constraint (required)
        - slot_type (required)
        - slot_type_version (optional)
        - value_elicitation_prompt (optional, block):
            - max_attempts (required)
            - message (required, block):
                - content (required)
                - content_type (required)
                - group_number (optional)
            - response_card (optional)
EOT

  type = map(object({
    name                    = string
    create_version          = optional(bool)
    description             = optional(string)
    parent_intent_signature = optional(string)
    region                  = optional(string)
    sample_utterances       = optional(set(string))
    fulfillment_activity = object({
      code_hook = optional(object({
        message_version = string
        uri             = string
      }))
      type = string
    })
    conclusion_statement = optional(object({
      message = list(object({
        content      = string
        content_type = string
        group_number = optional(number)
      }))
      response_card = optional(string)
    }))
    confirmation_prompt = optional(object({
      max_attempts = number
      message = list(object({
        content      = string
        content_type = string
        group_number = optional(number)
      }))
      response_card = optional(string)
    }))
    dialog_code_hook = optional(object({
      message_version = string
      uri             = string
    }))
    follow_up_prompt = optional(object({
      prompt = object({
        max_attempts = number
        message = list(object({
          content      = string
          content_type = string
          group_number = optional(number)
        }))
        response_card = optional(string)
      })
      rejection_statement = object({
        message = list(object({
          content      = string
          content_type = string
          group_number = optional(number)
        }))
        response_card = optional(string)
      })
    }))
    rejection_statement = optional(object({
      message = list(object({
        content      = string
        content_type = string
        group_number = optional(number)
      }))
      response_card = optional(string)
    }))
    slot = optional(list(object({
      description       = optional(string)
      name              = string
      priority          = optional(number)
      response_card     = optional(string)
      sample_utterances = optional(list(string))
      slot_constraint   = string
      slot_type         = string
      slot_type_version = optional(string)
      value_elicitation_prompt = optional(object({
        max_attempts = number
        message = list(object({
          content      = string
          content_type = string
          group_number = optional(number)
        }))
        response_card = optional(string)
      }))
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.lex_intents : (
        v.conclusion_statement == null || (length(v.conclusion_statement.message) >= 1 && length(v.conclusion_statement.message) <= 15)
      )
    ])
    error_message = "Each message list must contain between 1 and 15 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.lex_intents : (
        v.confirmation_prompt == null || (length(v.confirmation_prompt.message) >= 1 && length(v.confirmation_prompt.message) <= 15)
      )
    ])
    error_message = "Each message list must contain between 1 and 15 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.lex_intents : (
        v.follow_up_prompt == null || (length(v.follow_up_prompt.prompt.message) >= 1 && length(v.follow_up_prompt.prompt.message) <= 15)
      )
    ])
    error_message = "Each message list must contain between 1 and 15 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.lex_intents : (
        v.follow_up_prompt == null || (length(v.follow_up_prompt.rejection_statement.message) >= 1 && length(v.follow_up_prompt.rejection_statement.message) <= 15)
      )
    ])
    error_message = "Each message list must contain between 1 and 15 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.lex_intents : (
        v.rejection_statement == null || (length(v.rejection_statement.message) >= 1 && length(v.rejection_statement.message) <= 15)
      )
    ])
    error_message = "Each message list must contain between 1 and 15 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.lex_intents : (
        v.slot == null || (length(v.slot) <= 100)
      )
    ])
    error_message = "Each slot list must contain at most 100 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.lex_intents : (
        v.slot == null || alltrue([for item in v.slot : (item.value_elicitation_prompt == null || (length(item.value_elicitation_prompt.message) >= 1 && length(item.value_elicitation_prompt.message) <= 15))])
      )
    ])
    error_message = "Each message list must contain between 1 and 15 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.lex_intents : (
        v.sample_utterances == null || (alltrue([for x in v.sample_utterances : length(x) >= 1 && length(x) <= 200]))
      )
    ])
    error_message = "must be between 1 and 200 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.lex_intents : (
        v.slot == null || alltrue([for item in v.slot : (item.response_card == null || (length(item.response_card) >= 1 && length(item.response_card) <= 50000))])
      )
    ])
    error_message = "must be between 1 and 50000 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.lex_intents : (
        v.slot == null || alltrue([for item in v.slot : (item.sample_utterances == null || (alltrue([for x in item.sample_utterances : length(x) >= 1 && length(x) <= 200])))])
      )
    ])
    error_message = "must be between 1 and 200 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.lex_intents : (
        v.slot == null || alltrue([for item in v.slot : ((length(item.slot_type) >= 1 && length(item.slot_type) <= 100) && (can(regex("^((AMAZON\\.)_?|[A-Za-z]_?)+", item.slot_type))))])
      )
    ])
    error_message = "all of: must be between 1 and 100 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.lex_intents : (
        v.slot == null || alltrue([for item in v.slot : (item.slot_type_version == null || ((length(item.slot_type_version) >= 1 && length(item.slot_type_version) <= 64) && (can(regex("\\$LATEST|[0-9]+", item.slot_type_version)))))])
      )
    ])
    error_message = "all of: must be between 1 and 64 characters"
  }
  # Note: 7 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

