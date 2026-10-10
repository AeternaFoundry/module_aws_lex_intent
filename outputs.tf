output "lex_intents_id" {
  description = "Map of id values across all lex_intents, keyed the same as var.lex_intents"
  value       = { for k, v in aws_lex_intent.lex_intents : k => v.id if v.id != null && length(v.id) > 0 }
}
output "lex_intents_arn" {
  description = "Map of arn values across all lex_intents, keyed the same as var.lex_intents"
  value       = { for k, v in aws_lex_intent.lex_intents : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "lex_intents_checksum" {
  description = "Map of checksum values across all lex_intents, keyed the same as var.lex_intents"
  value       = { for k, v in aws_lex_intent.lex_intents : k => v.checksum if v.checksum != null && length(v.checksum) > 0 }
}
output "lex_intents_conclusion_statement" {
  description = "Map of conclusion_statement values across all lex_intents, keyed the same as var.lex_intents"
  value       = { for k, v in aws_lex_intent.lex_intents : k => one(v.conclusion_statement) if v.conclusion_statement != null && length(v.conclusion_statement) > 0 }
}
output "lex_intents_confirmation_prompt" {
  description = "Map of confirmation_prompt values across all lex_intents, keyed the same as var.lex_intents"
  value       = { for k, v in aws_lex_intent.lex_intents : k => one(v.confirmation_prompt) if v.confirmation_prompt != null && length(v.confirmation_prompt) > 0 }
}
output "lex_intents_create_version" {
  description = "Map of create_version values across all lex_intents, keyed the same as var.lex_intents"
  value       = { for k, v in aws_lex_intent.lex_intents : k => v.create_version if v.create_version != null }
}
output "lex_intents_created_date" {
  description = "Map of created_date values across all lex_intents, keyed the same as var.lex_intents"
  value       = { for k, v in aws_lex_intent.lex_intents : k => v.created_date if v.created_date != null && length(v.created_date) > 0 }
}
output "lex_intents_description" {
  description = "Map of description values across all lex_intents, keyed the same as var.lex_intents"
  value       = { for k, v in aws_lex_intent.lex_intents : k => v.description if v.description != null && length(v.description) > 0 }
}
output "lex_intents_dialog_code_hook" {
  description = "Map of dialog_code_hook values across all lex_intents, keyed the same as var.lex_intents"
  value       = { for k, v in aws_lex_intent.lex_intents : k => one(v.dialog_code_hook) if v.dialog_code_hook != null && length(v.dialog_code_hook) > 0 }
}
output "lex_intents_follow_up_prompt" {
  description = "Map of follow_up_prompt values across all lex_intents, keyed the same as var.lex_intents"
  value       = { for k, v in aws_lex_intent.lex_intents : k => one(v.follow_up_prompt) if v.follow_up_prompt != null && length(v.follow_up_prompt) > 0 }
}
output "lex_intents_fulfillment_activity" {
  description = "Map of fulfillment_activity values across all lex_intents, keyed the same as var.lex_intents"
  value       = { for k, v in aws_lex_intent.lex_intents : k => one(v.fulfillment_activity) if v.fulfillment_activity != null && length(v.fulfillment_activity) > 0 }
}
output "lex_intents_last_updated_date" {
  description = "Map of last_updated_date values across all lex_intents, keyed the same as var.lex_intents"
  value       = { for k, v in aws_lex_intent.lex_intents : k => v.last_updated_date if v.last_updated_date != null && length(v.last_updated_date) > 0 }
}
output "lex_intents_name" {
  description = "Map of name values across all lex_intents, keyed the same as var.lex_intents"
  value       = { for k, v in aws_lex_intent.lex_intents : k => v.name if v.name != null && length(v.name) > 0 }
}
output "lex_intents_parent_intent_signature" {
  description = "Map of parent_intent_signature values across all lex_intents, keyed the same as var.lex_intents"
  value       = { for k, v in aws_lex_intent.lex_intents : k => v.parent_intent_signature if v.parent_intent_signature != null && length(v.parent_intent_signature) > 0 }
}
output "lex_intents_region" {
  description = "Map of region values across all lex_intents, keyed the same as var.lex_intents"
  value       = { for k, v in aws_lex_intent.lex_intents : k => v.region if v.region != null && length(v.region) > 0 }
}
output "lex_intents_rejection_statement" {
  description = "Map of rejection_statement values across all lex_intents, keyed the same as var.lex_intents"
  value       = { for k, v in aws_lex_intent.lex_intents : k => one(v.rejection_statement) if v.rejection_statement != null && length(v.rejection_statement) > 0 }
}
output "lex_intents_sample_utterances" {
  description = "Map of sample_utterances values across all lex_intents, keyed the same as var.lex_intents"
  value       = { for k, v in aws_lex_intent.lex_intents : k => v.sample_utterances if v.sample_utterances != null && length(v.sample_utterances) > 0 }
}
output "lex_intents_slot" {
  description = "Map of slot values across all lex_intents, keyed the same as var.lex_intents"
  value       = { for k, v in aws_lex_intent.lex_intents : k => v.slot if v.slot != null && length(v.slot) > 0 }
}
output "lex_intents_version" {
  description = "Map of version values across all lex_intents, keyed the same as var.lex_intents"
  value       = { for k, v in aws_lex_intent.lex_intents : k => v.version if v.version != null && length(v.version) > 0 }
}

