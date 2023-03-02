<?php
$resultado = $_GET['resultado'] ?? null;

    require '../includes/funciones.php';
    incluirTemplate('header');
?>

<main class="contenedor seccion">
    <h1>Administrador de Bienes Raices</h1>
    <?php if( intval ($resultado )=== 1 ): ?>
        <p class="alerta exito">Anuncio creado correctamente</p>
    <?php endif; ?>

    <a href="../admin/propiedades/crear.php" class="boton boton-verde">Nueva Propiedad</a>

    <table class="propiedad">
        <thead>
            <tr>
                <th>ID</th>
                <th>Titulo</th>
                <th>Imagen</th>
                <th>Precio</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>1</td>
                <td>Casa en la plata</td>
                <td><img src="/imagenes/0fa8d8770dcdf9acebf38f2e9b8833d8.jpg" class="imagen-table"alt=""></td>
                <td></td>
                <td></td>
            </tr>
        </tbody>
    </table>
</main>

<?php 
    incluirTemplate('footer');
?>