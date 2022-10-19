variable project_name { 
    default = "terraedit-365302"
}

variable region { 
    default = "us-central1"
}

variable zone { 
    default = "us-central1-c"
}

variable vpc_network { 
    default = "terraform-network"
}

variable vm_instance_name { 
    default = "terraedit"
}

variable machine_type{ 
    default = "debian-cloud/debian-11"
}

variable ssh_user{ 
    default =  "adrabenche"
}

variable ssh_key{ 
    default =  "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDOacxL1ivydoFWU/YGTCbA6+KqoTbofRlNFjGM1KHRyUwCytXI+7v61tcnjWucyWwia8dDzjHCJXVBedzdedKXBposO0vJSnkeC2+8wScVkT8S7cOM/4W9eF4ImlzXJQKUTW3U9ZjY2wWGZzt2v/oXiDIa+C1xmaJDsP6TLJJzBvq9Jw8Te7FK2uL/BoAgQ0aiZohiXOi0S7rQKvRLYjP0ccLRDSBtwm92rAXptQp/Y7cFF+c9fZ87ARtgAOrjBtRSre/2ZDctK8vJLc1tlWJni3QXpPwplbeFxQGz45VeaJnrDDXMRZlQIGOeWEUn+1kR69semqcAq8N6PuDYwGVU7VaBgFGr5HojoXulFyDhndsWfGst2ua3C6teFCyyXBj8OKacLEiYo/kKoBgFhx1s9Rg+x9y3wzzqdmzN2YMsW+MEQxfGxkCyQ9tb1ZT2HlADoo9Jal4SymDi6YlJ4HYcAtYzyuKgUZ7KCTYC3HZ70ganDPjYRPKiU+NxR6gnjaP+LrZX3M44Dbm/pP+klr6hucUo0v2YdoNsrBrcS8Xef2cDR/wXFoCA+/rbpQ0lEdmM4YVxvQsQgAW0mZpjMtt+R1Ut3/zduXwZxIofS10eCVEeJBicCGfvLBvDkA+NmmM1btSby66DGYYb3GhOguokdJtECFAt96IhBggvhbXF2Q=="
}

variable firewall_rules {
    default = "test-firewall"
}