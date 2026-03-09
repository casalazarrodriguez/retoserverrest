@regresion

Feature:
  Como un administrador del sistema,
  Quiero poder gestionar los usuarios a través de la API,
  Para administrar la base de datos de usuarios.

  Criterios de Aceptacion:
  - Se puede obtener una lista de todos los usuarios.
  - Se puede registrar un nuevo usuario con datos válidos.
  - Se puede buscar un usuario específco por su ID.
  - Se puede actualizar la información de un usuario existente.
  - Se puede eliminar un usuario del sistema.


  Background: Precondicion
    Given url baseURL
    * def usuarios = 'usuarios'

#    --Happypath--

  @TESTCASE-1 @listarusuarios @happypath
  Scenario: Obtener lista de todos los usuarios - OK
    Given path usuarios
    When method GET
    Then status 200
    * assert status == 200

  @TESTCASE-2 @registrarusuario @happypath
  Scenario: Registrar nuevo usuario con datos validos - OK
    * def nuevoUsuario = read('classpath:examples/json/nuevoUsuario.json')
    Given path usuarios
    And request nuevoUsuario
    When method POST
    Then status 201
    * assert status == 201

  @TESTCASE-3 @buscarusuarioid @happypath
  Scenario: Buscar usuario especifico por ID - OK
    Given path usuarios, '0uxuPY0cbmQhpEz1'
    When method GET
    Then status 200
    * assert status == 200

  @TESTCASE-4 @actualizarusuario @happypath
  Scenario: Actualizar informacion de un usuario existente - OK
    * def usuarioActualizado = read('classpath:examples/json/actualizarUsuario.json')
    Given path usuarios, '0uxuPY0cbmQhpEz1'
    And request usuarioActualizado
    When method PUT
    Then status 200
    * assert status == 200

  @TESTCASE-5 @eliminarusuario @happypath
  Scenario:Eliminar un usuario del sistema - OK
    Given path usuarios, '0uxuPY0cbmQhpEz1'
    When method DELETE
    Then status 200
    * assert status == 200

    #    --UnHappypath--

  @TESTCASE-6 @registrarusuario @unhappypath
  Scenario: Validar respuestas al enviar json vacio en enpoint RegistrarUsuario - NO OK
    * def nuevoUsuario = read('classpath:examples/json/usuarioVacio.json')
    Given path usuarios
    And request nuevoUsuario
    When method POST
    Then status 400
    And assert status == 401
    And response.nome = 'nome é obrigatório'
    And response.email = 'email é obrigatório'
    And response.password = 'password é obrigatório'
    And response.administrador = 'administrador é obrigatório'


