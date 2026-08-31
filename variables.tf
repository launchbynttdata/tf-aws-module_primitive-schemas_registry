// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

variable "name" {
  description = "Name of the schema registry. Must be between 1 and 64 characters and may contain letters, numbers, hyphens, underscores, and periods."
  type        = string

  validation {
    condition     = length(var.name) >= 1 && length(var.name) <= 64
    error_message = "Name must be between 1 and 64 characters."
  }

  validation {
    condition     = can(regex("^[0-9A-Za-z._-]+$", var.name))
    error_message = "Name may contain only letters, numbers, hyphens, underscores, and periods."
  }
}

variable "description" {
  description = "Description of the schema registry."
  type        = string
  default     = null
}

variable "tags" {
  description = "Map of tags to assign to the schema registry."
  type        = map(string)
  default     = {}
}
