# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


# $(document).ready(function() {
#   $("#basic-form").validate({
#     rules: {
#       name : {
#         required: true,
#         minlength: 3
#       },
#       age: {
#         required: true,
#         number: true,
#         min: 18
#       },
#       email: {
#         required: true,
#         email: true
#       },
#       weight: {
#         required: {
#           depends: function(elem) {
#             return $("#age").val() > 50
#           }
#         },
#         number: true,
#         min: 0
#       }
#     },
#     messages : {
#       name: {
#         minlength: "Name should be at least 3 characters"
#       },
#       age: {
#         required: "Please enter your age",
#         number: "Please enter your age as a numerical value",
#         min: "You must be at least 18 years old"
#       },
#       email: {
#         email: "The email should be in the format: abc@domain.tld"
#       },
#       weight: {
#         required: "People with age over 50 have to enter their weight",
#         number: "Please enter your weight as a numerical value"
#       }
#     }
#   });
# });

$(document).ready ->
  $('#suscription-form').validate
    rules:
      'form[nombre]':
        required: true
        minlength: 3
      'form[apellidos]':
        required: true
        minlength: 3
      'form[cedula]':
        required: true
        number: true
        minlength: 9
        maxlength: 9
      'form[email]':
        required: true
        email: true
      'form[telefono]':
        required: true
        number: true
      'form[institucion]':
        required: true
        minlength: 3
      'form[cargo]':
        required: true
        minlength: 3
      'form[profesion]':
        required: true
        minlength: 3
    messages:
      'form[nombre]':
        minlength: 'El nombre debe tener almenos 3 caracteres'
        required: 'El nombre es requerido'
      'form[apellidos]':
        minlength: 'Los apellidos deben tener almenos 3 caracteres'
        required: 'El apellido es requerido'
      'form[cedula]':
        number: 'La cédula solo puede tener digitos del 0 al 9'
        required: 'La cédula es requerida'
        minlength: 'Solo puede tener 9 dígitos'
        maxlength: 'Solo puede tener 9 dígitos'
      'form[email]':
        required: 'El email es requerido'
        email: 'El email debe tener el siguiente formato: micorreo@dominio.com'
      'form[telefono]':
        number: 'Solo puede tener digitos del 0 al 9'
        required: 'El teléfono es requerido'
      'form[institucion]':
        required: 'La institución es requerida'
        minlength: 'La institución debe tener almenos 3 caracteres'
      'form[cargo]':
        required: 'El cargo es requerido'
        minlength: 'El cargo debe tener almenos 3 caracteres'
      'form[profesion]':
        required: 'La profesión es requerida'
        minlength: 'La profesión debe tener almenos 3 caracteres'
  return
