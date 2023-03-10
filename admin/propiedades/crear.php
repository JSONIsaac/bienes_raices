<?php
    //Base de datos
    require '../../includes/config/database.php';
   $db = conectarDB();

   //Consultar para obrtener los vendedores
   $consulta = "SELECT * FROM vendedores";
   $resultado = mysqli_query($db, $consulta);


//    echo "<pre>";
//    var_dump($_SERVER['REQUEST_METHOD']);
//    "</pre>";

    //Arreglo con mensajes de errors

    $errores = [];

    $titulo = '';
    $precio ='';
    $descripcion = '';
    $habitaciones = '';
    $wc = '';
    $estacionamiento = '';
    $vendedores_id = '';

    //Ejecutar el codigo despues de que el usuario envia el formulario
   if($_SERVER['REQUEST_METHOD'] === 'POST'){

        // echo "<pre>";
        // var_dump($_POST);
        // "</pre>";

        echo "<pre>";
        var_dump($_FILES);
        "</pre>";
        

        $titulo = mysqli_real_escape_string($db,  $_POST['titulo']);
        $precio = mysqli_real_escape_string($db,  $_POST['precio']);
        $descripcion = mysqli_real_escape_string($db,  $_POST['descripcion']);
        $habitaciones = mysqli_real_escape_string($db,  $_POST['habitaciones']);
        $wc = mysqli_real_escape_string($db,  $_POST['wc']);
        $estacionamiento =  mysqli_real_escape_string($db, $_POST['estacionamiento']);
        $vendedores_id = mysqli_real_escape_string($db,  $_POST['vendedor']);
        $creado =  date('Y/m/d');

        //Asignar files
        $imagen = $_FILES['imagen'];

        if(!$titulo){
            $errores[] = "Debes aniadir un titulo";
        }
        if(!$precio){
            $errores[] = "El precio es obligatorio";
        }

        if(strlen(!$descripcion)){
            $errores[] = "la descripcion es obligatoria y debe tener al menos 50 caracteres";
        }
        if(!$habitaciones){
            $errores[] = "El Numero de habitaciones es obligatorio";
        }

        if(!$wc){
            $errores[] = "El Numero de banios es obligatorio";
        }
        if(!$estacionamiento){
            $errores[] = "El Numero de lugares de estacionamiento es obligatorio";
        }
        if(!$vendedores_id){
            $errores[] = "Elige un vendedor";
        }
        if(!$imagen['name'] || $imagen['error']){
            $errores[]= "La imagen es obligatoria";
        }

        //Validar por tama;o (//100 kb max)

            $medida = 1000 * 1000;
            if($imagen['size'] > $medida){
                $errores[]= "Imagen muy pesada";
            }

        // echo "<pre>";
        // var_dump($errores);
        // echo "</pre>";
  
        //Revisar qu eel array de errores este vacio
        if(empty($errores)){


            /*Subida de archivos */

            //Crear carpeta
            $carpetaImagenes = "../../imagenes/";

            if(!is_dir($carpetaImagenes)){
                mkdir($carpetaImagenes);
            }

            //Generar un nombre unico
            $nombreImagen = md5( uniqid( rand(), true )) . ".jpg";

            //subir la imagen
            move_uploaded_file($imagen['tmp_name'], $carpetaImagenes . $nombreImagen);

            //Insertar en la base de datos
            $query = "INSERT INTO propiedades  (titulo, precio, imagen, descripcion, habitaciones, wc, estacionamiento, creado,
            vendedores_id ) VALUES ( '$titulo', '$precio', '$nombreImagen', '$descripcion', '$habitaciones', '$wc', '$estacionamiento', '$creado', '$vendedores_id')";

            $resultado = mysqli_query($db, $query);

            if($resultado){
                //redireccionar al usuario
                header('Location: ../../../../../bienesraices_inicio/admin/index.php?resultado=1');

                echo "Insertado correctamente";
            }
        }
   }


    require '../../includes/funciones.php';
    incluirTemplate('header');
?>

<main class="contenedor seccion">
    <h1>Crear</h1>

    <?php foreach($errores as $error):?>
    <div class="alerta error">
        <?php echo $error;?>

    </div>

    <?php endforeach;?>


    <a href="../index.php" class="boton boton-verde">Volver</a>

    <form action="" class="formulario" method="post" action="/admin/propiedades/crear.php" enctype="multipart/form-data">
        <fieldset>
            <legend>Informacion General</legend>

            <label for="tituo">Titulo:</label>
            <input type="text" id="titulo" name="titulo" placeholder="Titulo Propiedad" value="<?php echo $titulo;?>">

            <label for="precio">Precio:</label>
            <input type="number" id="precio" name="precio"  placeholder="Precio Propiedad" value="<?php echo $precio;?>">

            <label for="imagen">Imagen:</label>
            <input type="file" id="imagen"  accept="image/jpeg, image/png" name="imagen">

            <label for="descripcion">Descripcion:</label>
            <textarea id="descripcion" name="descripcion"><?php echo $descripcion;?></textarea>

            <fieldset>
                <legend>Informacion Propiedad</legend>

                <label for="habitaciones">Habitaciones:</label>
                <input type="number" id="habitaciones" name="habitaciones" placeholder="Ej:3" min="1" max="9" value="<?php echo $habitaciones;?>">
            
                <label for="wc">Ba??os:</label>
                <input type="number" id="wc" name="wc" placeholder="Ba??os" min="1" max="9" value="<?php echo $wc;?>">
            
                <label for="estacionamiento">Estacionamiento:</label>
                <input type="number" id="estacionamiento" name="estacionamiento" placeholder="Estacionamiento" min="1" max="9" value="<?php echo $estacionamiento;?>">
            </fieldset>

            <fieldset>
                <legend>Vendedor</legend>

                <select name="vendedor" id="">
                    <option value="">--- Seleccione ---</option>
                    <?php while($vendedor = mysqli_fetch_assoc($resultado)):?>
                        <option <?php echo $vendedores_id === $vendedor['id'] ? 'selected' : ''; ?> value="<?php echo $vendedor['id']; ?>">
                        <?php echo $vendedor['nombre'] . " ". $vendedor['apellido']; ?></option>
                    <?php endwhile;?>
                </select>
            </fieldset>

            <input type="submit" value="Crear Propiedad" class="boton boton-verde">
        </form>
</main>

<?php 
    incluirTemplate('footer');
?>