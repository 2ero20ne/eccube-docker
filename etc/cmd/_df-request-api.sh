#!/bin/bash

source ./.env

query=`cat << EOS
{
  products {
    id
    name
    ProductClasses {
      id
      code
      price02
      stock
    }
    Status {
      id
      name
    }
    Creator {
      id
    }
    ProductTag {
      id
    }
  }
  orders {
    id
    pre_order_id
    name01
    name02
    message
    Country {
      id
    }
    OrderItems {
      id
      product_name
      price
    }
    Shippings {
      id
    }
  }
  customers {
    name01
    name02
    email
    point
  }
}
EOS
`

curl --location --request POST 'http://localhost:28080/api' \
  --header 'Content-Type: application/x-www-form-urlencoded' \
  --header "Authorization: Bearer ${API_TOKEN}" \
  --data-raw "{\"query\": \"${query}\",\"variables\":{}}" | jq .
