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
    * def JsonUsuarios = 'usuarios'
    * def JsonNuevoUsuario = read('classpath:examples/json/nuevoUsuario.json')
    * def jsonUsuarioVacio = read('classpath:examples/json/usuarioVacio.json')
    * def JsonUsuarioActualizado = read('classpath:examples/json/actualizarUsuario.json')


#    --Happypath--

  @TESTCASE-1 @listarusuarios @happypath
  Scenario: Obtener lista de todos los usuarios - OK
    And path JsonUsuarios
    When method GET
    Then status 200

  @TESTCASE-2 @registrarusuario @happypath
  Scenario: Registrar nuevo usuario con datos validos - OK
    And path JsonUsuarios
    And request JsonNuevoUsuario
    When method POST
    Then status 201

  @TESTCASE-3 @buscarusuarioid @happypath
  Scenario: Buscar usuario especifico por ID - OK
    And path JsonUsuarios, '0uxuPY0cbmQhpEz1'
    When method GET
    Then status 200

  @TESTCASE-4 @actualizarusuario @happypath
  Scenario: Actualizar informacion de un usuario existente - OK
    And path JsonUsuarios, '0uxuPY0cbmQhpEz1'
    And request JsonUsuarioActualizado
    When method PUT
    Then status 200

  @TESTCASE-5 @eliminarusuario @happypath
  Scenario:Eliminar un usuario del sistema - OK
    And path JsonUsuarios, 'lZAa1Aj8Go60nMNI'
    When method DELETE
    Then status 200

    #    --UnHappypath--

  @TESTCASE-6 @registrarusuario @unhappypath
  Scenario: Validar respuestas al enviar json vacio en enpoint RegistrarUsuario - NO OK
    And path JsonUsuarios
    And request jsonUsuarioVacio
    When method POST
    Then status 400
    And response.nome = 'nome é obrigatório'
    And response.email = 'email é obrigatório'
    And response.password = 'password é obrigatório'
    And response.administrador = 'administrador é obrigatório'

