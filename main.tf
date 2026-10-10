resource "aws_lex_intent" "lex_intents" {
  for_each = var.lex_intents

  name                    = each.value.name
  create_version          = each.value.create_version
  description             = each.value.description
  parent_intent_signature = each.value.parent_intent_signature
  region                  = each.value.region
  sample_utterances       = each.value.sample_utterances

  fulfillment_activity {
    dynamic "code_hook" {
      for_each = each.value.fulfillment_activity.code_hook != null ? [each.value.fulfillment_activity.code_hook] : []
      content {
        message_version = code_hook.value.message_version
        uri             = code_hook.value.uri
      }
    }
    type = each.value.fulfillment_activity.type
  }

  dynamic "conclusion_statement" {
    for_each = each.value.conclusion_statement != null ? [each.value.conclusion_statement] : []
    content {
      dynamic "message" {
        for_each = conclusion_statement.value.message
        content {
          content      = message.value.content
          content_type = message.value.content_type
          group_number = message.value.group_number
        }
      }
      response_card = conclusion_statement.value.response_card
    }
  }

  dynamic "confirmation_prompt" {
    for_each = each.value.confirmation_prompt != null ? [each.value.confirmation_prompt] : []
    content {
      max_attempts = confirmation_prompt.value.max_attempts
      dynamic "message" {
        for_each = confirmation_prompt.value.message
        content {
          content      = message.value.content
          content_type = message.value.content_type
          group_number = message.value.group_number
        }
      }
      response_card = confirmation_prompt.value.response_card
    }
  }

  dynamic "dialog_code_hook" {
    for_each = each.value.dialog_code_hook != null ? [each.value.dialog_code_hook] : []
    content {
      message_version = dialog_code_hook.value.message_version
      uri             = dialog_code_hook.value.uri
    }
  }

  dynamic "follow_up_prompt" {
    for_each = each.value.follow_up_prompt != null ? [each.value.follow_up_prompt] : []
    content {
      prompt {
        max_attempts = follow_up_prompt.value.prompt.max_attempts
        dynamic "message" {
          for_each = follow_up_prompt.value.prompt.message
          content {
            content      = message.value.content
            content_type = message.value.content_type
            group_number = message.value.group_number
          }
        }
        response_card = follow_up_prompt.value.prompt.response_card
      }
      rejection_statement {
        dynamic "message" {
          for_each = follow_up_prompt.value.rejection_statement.message
          content {
            content      = message.value.content
            content_type = message.value.content_type
            group_number = message.value.group_number
          }
        }
        response_card = follow_up_prompt.value.rejection_statement.response_card
      }
    }
  }

  dynamic "rejection_statement" {
    for_each = each.value.rejection_statement != null ? [each.value.rejection_statement] : []
    content {
      dynamic "message" {
        for_each = rejection_statement.value.message
        content {
          content      = message.value.content
          content_type = message.value.content_type
          group_number = message.value.group_number
        }
      }
      response_card = rejection_statement.value.response_card
    }
  }

  dynamic "slot" {
    for_each = each.value.slot != null ? each.value.slot : []
    content {
      description       = slot.value.description
      name              = slot.value.name
      priority          = slot.value.priority
      response_card     = slot.value.response_card
      sample_utterances = slot.value.sample_utterances
      slot_constraint   = slot.value.slot_constraint
      slot_type         = slot.value.slot_type
      slot_type_version = slot.value.slot_type_version
      dynamic "value_elicitation_prompt" {
        for_each = slot.value.value_elicitation_prompt != null ? [slot.value.value_elicitation_prompt] : []
        content {
          max_attempts = value_elicitation_prompt.value.max_attempts
          dynamic "message" {
            for_each = value_elicitation_prompt.value.message
            content {
              content      = message.value.content
              content_type = message.value.content_type
              group_number = message.value.group_number
            }
          }
          response_card = value_elicitation_prompt.value.response_card
        }
      }
    }
  }
}

