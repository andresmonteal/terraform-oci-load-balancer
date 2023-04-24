load_balancers = {
  "LOAD-BALANCER-NAME" = {
    cmp           = ["LVL1", "LVL2", "LVL3"]
    shape         = "flexible"
    subnet        = "SUBNET-NAME"
    type          = "public"
    defined_tags  = { "NAMESPACE.TAG" = "VALUE", "NAMESPACE.TAG" = "VALUE-2" }
    shape_details = { "max_bandwidth" = 100, "min_bandwidth" = 10 }

    health_checks = {
      basic_http = {
        protocol            = "HTTP"
        interval_ms         = 1000
        port                = 80
        response_body_regex = ".*"
        retries             = 3
        return_code         = 200
        timeout_in_millis   = 3000
        url_path            = "/"
      }
    }

    backend_sets = {
      BESET-01 = {
        policy                  = "ROUND_ROBIN"
        health_check_name       = "basic_http"
        enable_persistency      = false
        enable_ssl              = false
        cookie_name             = null
        disable_fallback        = null
        certificate_name        = null
        verify_depth            = null
        verify_peer_certificate = null

        backends = {
          BE-1 = {
            ip      = "100.69.133.62"
            port    = 80
            backup  = false
            drain   = false
            offline = false
            weight  = 1
          },
          BE-2 = {
            ip      = "100.69.133.50"
            port    = 80
            backup  = false
            drain   = false
            offline = false
            weight  = 1
          }
        }
      }
    }

    listeners = {
      LSR-01 = {
        default_backend_set_name = "BESET-01"
        port                     = 80
        protocol                 = "HTTP"
        idle_timeout             = 180
        hostnames                = []
        path_route_set_name      = null
        rule_set_names           = null
        enable_ssl               = false
        certificate_name         = null
        verify_depth             = 5
        verify_peer_certificate  = true
      }
    }
  }
}