# OrderPizza
Pedidos Pizza - Proyecto de Modulo I Arquitectura de microservicios


Pizza.WebApi
Descripción
API diseñada para gestionar pedidos de pizza, personalización de pizzas, ingredientes y órdenes de clientes.

Lista de Endpoints

Ingredientes
GET /Ingredient
Descripción: Obtiene todos los ingredientes disponibles.
Parámetros: Ninguno.
Respuesta:
Código 200: Lista de ingredientes.

Órdenes
POST /Order
Descripción: Crea una nueva orden.
Parámetros:
{
    "id": 1,
    "orderStatus": "string",
    "customer": "string",
    "address": "string",
    "orderDate": "2024-01-01T00:00:00Z",
    "details": [
        {
            "id": 1,
            "pizzaId": 1,
            "detail": "string",
            "price": 9.99,
            "quantity": 2,
            "discount": 0,
            "subtotal": 19.98
        }
    ],
    "totalWithoutDisc": 19.98,
    "discount": 0,
    "deliveryCost": 2.99,
    "total": 22.97
}

Respuesta:
Código 200: Orden creada exitosamente.

GET /Order/{id}
Descripción: Obtiene detalles de una orden por su ID.
Parámetros:
id (en la URL): integer, requerido.
Respuesta:
Código 200: Detalles de la orden.

Pizzas
GET /Pizza
Descripción: Obtiene todas las pizzas disponibles.
Parámetros: Ninguno.
Respuesta:
Código 200: Lista de pizzas.

GET /Pizza/{id}
Descripción: Obtiene detalles de una pizza por su ID.
Parámetros:
id (en la URL): integer, requerido.
Respuesta:
Código 200: Detalles de la pizza.

POST /Pizza/customize
Descripción: Crea una pizza personalizada.
Parámetros:
{
    "id": 1,
    "ingredients": [
        {
            "id": 1,
            "ingredientId": 2
        }
    ],
    "price": 15.99
}
Respuesta:
Código 200: Pizza personalizada creada exitosamente.

POST /Pizza/preset/{id}
Descripción: Selecciona una pizza preestablecida por su ID.
Parámetros:
id (en la URL): integer, requerido.
Respuesta:
Código 200: Pizza seleccionada exitosamente.

Casos de Prueba
Prueba 1: Obtener ingredientes
Realizar una solicitud GET /Ingredient.
Validar que la respuesta tenga un código 200 y devuelva una lista de ingredientes.
Prueba 2: Crear una orden
Realizar una solicitud POST /Order con el siguiente cuerpo:

{
    "id": 1,
    "orderStatus": "Pending",
    "customer": "John Doe",
    "address": "123 Pizza St",
    "orderDate": "2024-01-01T12:00:00Z",
    "details": [
        {
            "id": 1,
            "pizzaId": 1,
            "detail": "Extra cheese",
            "price": 12.5,
            "quantity": 1,
            "discount": 2.5,
            "subtotal": 10
        }
    ],
    "totalWithoutDisc": 12.5,
    "discount": 2.5,
    "deliveryCost": 3,
    "total": 13
}

Validar que la respuesta tenga un código 200.

Prueba 3: Obtener detalles de una pizza
Realizar una solicitud GET /Pizza/1.
Validar que la respuesta tenga un código 200 y devuelva detalles de la pizza con ID 1.

Prueba 4: Personalizar una pizza
Realizar una solicitud POST /Pizza/customize con el siguiente cuerpo:

{
    "id": 2,
    "ingredients": [
        { "id": 1, "ingredientId": 3 },
        { "id": 2, "ingredientId": 5 }
    ],
    "price": 18.5
}
Validar que la respuesta tenga un código 200.


