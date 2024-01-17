# required
variable "backendset_name" {
  type        = string
  description = "(Required) The name of the backend set to add the backend server to. Example: example_backend_set"
}

variable "ip_address" {
  type        = string
  description = "(Required) The IP address of the backend server. Example: 10.0.0.3"
}

variable "port" {
  type        = number
  description = "(Required) The communication port for the backend server. Example: 8080"
}

# optional

variable "backup" {
  type        = bool
  description = "(Optional) (Updatable) Whether the load balancer should treat this server as a backup unit. If true, the load balancer forwards no ingress traffic to this backend server unless all other backend servers not marked as backup fail the health check policy."
  default     = null
}

variable "compartment_id" {
  type        = string
  description = "The OCID of the compartment containing the load balancer."
  default     = null
}

variable "compartment_name" {
  type        = string
  description = "The name of the compartment containing the load balancer."
  default     = null
}

variable "drain" {
  type        = bool
  description = "(Optional) (Updatable) Whether the load balancer should drain this server. Servers marked drain receive no new incoming traffic. Example: false"
  default     = null
}

variable "load_balancer_id" {
  type        = string
  description = "(Required) The OCID of the load balancer associated with the backend set and servers."
  default     = null
}

variable "load_balancer_name" {
  type        = string
  description = "A user-friendly name. It does not have to be unique, and it is changeable."
  default     = null
}

variable "offline" {
  type        = bool
  description = "(Optional) (Updatable) Whether the load balancer should treat this server as offline. Offline servers receive no incoming traffic. Example: false"
  default     = null
}

variable "tenancy_ocid" {
  description = "(Updatable) The OCID of the root compartment"
  type        = string
  default     = null
}

variable "weight" {
  type        = number
  description = "(Optional) (Updatable) The load balancing policy weight assigned to the server. Backend servers with a higher weight receive a larger proportion of incoming traffic. For example, a server weighted '3' receives 3 times the number of new connections as a server weighted '1'. For more information on load balancing policies, see How Load Balancing Policies Work. Example: 3"
  default     = null
}