<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\web\Request;
use yii\web\JsExpression;
use yii\bootstrap\Modal;
use yii\jui\AutoComplete;
use app\modules\rh\models\RhTrab;
use app\modules\rh\models\RhPlaza;
use app\modules\rh\models\RhTrabActivo;
use app\modules\rh\models\RhAusencia;
use yii\widgets\ActiveForm;
use kartik\widgets\DatePicker;
use kartik\DateControl\Module;
use kartik\datecontrol\DateControl;
use kartik\widgets\Select2;

/* @var $this yii\web\View */
/* @var $model app\modules\rh\models\RhAusencia */
/* @var $form yii\widgets\ActiveForm */
?>

<?php
  Modal::begin([
    'header'=>null,
    'id' => 'popup1',
    'size'=>'modal-md',
  ]);
  echo "<div id='popup-content'></div>";
  Modal::end();
?>
<?php
  $fechaDel = "Del...";
  $fechaAl = "Al...;";
?>

<?php
  $this->registerCss("
    div.required label.control-label:after {
      content: ' *'';
      color: red;
    }
  ");

  $this->registerJs("
  // register jQuery extension
  jQuery.extend(jQuery.expr[':'], {
    focusable: function (el, index, selector) {
        return $(el).is('input:enabled[type!=hidden], select, button[type=submit], [tabindex]');
        //return $(el).is('input:enabled[type!=hidden], select, textarea, [tabindex]');
        //return $(el).is(':input[type!=hidden], :input[type!=readonly], [tabindex]');
        //return $(el).is('a, button, :input, [tabindex]');
    }
  });

  $(document).on('keypress', 'input,select', function (e) {
    if (e.which == 13) {
        e.preventDefault();
        // Get all focusable elements on the page
        var canfocus = $(':focusable');
        var index = canfocus.index(this) + 1;
        if (index >= canfocus.length) index = 0;
        canfocus.eq(index).focus();
    }
  });

  $('#btn_lookup_click').on('click', function(e) {
    console.log('Click');
    $('#popup1').modal('show').find('#popup-content').load($(this).attr('value'));
  });

  // Recibe un registro con los datos de una clave_plaza
  // el cual formatea en formato html para mostrarlo
  // en el formulario
  function infoToHtml(infoJson)
  {
    // info es un registro con los campos: Tipo, Descanso, Jornada, Categoria, Clasificacion, IdPlaza, Plaza,
    // en formato json
   elementText='<div>';
   elementText='<span class=\'text-left text-muted\'>' + infoJson.Categoria+'</span><br />';
   elementText+='<span class=\'text-left text-muted\'>'+ infoJson.Clasificacion + ', ' + 'J-' + infoJson.Jornada + ', descansa el ' + infoJson.Descanso + '</span><br />';
   elementText+='</div>';
   return elementText;
  }

  function infoToText(infoJson)
  {
   elementText='';
   elementText='Categoria: ' + infoJson.Categoria + '\\r\\n';
   elementText+='Clasificación: ' + infoJson.Clasificacion + '\\r\\n';
   elementText+='Jornada: ' + infoJson.Jornada + '\\r\\n';
   elementText+='Descanso: ' + infoJson.Descanso;
   return elementText;
  }

  // Buscar los datos del trabajador por su ficha
  $('#clave_trab').on('change blue', function(e) {
    var url='". Url::to(['rh-trab/get-situacion-trab']) . "';
    // Llamar via ajax a una rutina que verifique al Trabajador
    console.log('clave_trab cambió!');
    jQuery.ajax(url, {
      'dataType': 'json',
      'method': 'get',
      'success': function (result) {
        if (result.Ficha!='') {
          console.log('Ficha tiene valor : ' + result.Ficha);
          if (result.Plaza === '') {
            console.log('Plaza NO tiene valor');
            alert ('Trabajador sin relación laboral actual.');
            $('#info').html('');
            $('#nombreTrab').html('');
            $('#clave_plaza').val('');
            $('#id_plaza').val('');
          }
          else {
            console.log('Plaza tiene valor : ' + result.Plaza);
            $('#id_plaza').val(result.IdPlaza);
            console.log ('Estableciendo id_plaza=' + result.IdPlaza);
            $('#nombreTrab').html('<span class=\"text-left text-muted\">'+result.Trabajador+'</span>');
            $('#info').html(infoToHtml(result));
            console.log('Estableciendo clave_plaza='+result.Plaza);

            $('#clave_plaza').val(result.Plaza);
          }
        }
      },
      'error': function (e) {
        console.log ('Hubo un error ' + e.status + ' ' + e.responseText);
        $('#nombreTrab').html('Error con este trabajador: ' + e.responseText);
        if ($('#clave_trab').val()!='') {
          alert ('Este trabajador no está registrado.');
        }
        $('#id_plaza').val(0);
        $('#nombre_trab').html('');
        $('#info').html('');
        $('#clave_plaza').val('');
      },
      'cache': false,
      //'data': jQuery(this).parents('form').serialize(),
      'data': {clave_trab: $('#clave_trab').val()},
    })
  });

  function actualizaDatosPlaza(idPlaza)
  {
    url='" . Url::to(['rh-plaza/get-datos-plaza-por-id']) . "';
    jQuery.ajax(url, {
      'dataType': 'json',
      'method': 'get',
      'success': function (r) {
        $('#info').html(infoToHtml(r));
      },
      'error': function(e) {
        console.log('Error!');
      },
      'cache': false,
      'data': {id:idPlaza},
    });
  }

  $(document).on('beforeSubmit', 'form#frm_add_ausencia', function() {
    alert ('clave_plaza=' + $('#clave_plaza').val() + ', id_plaza='+$('#id_plaza').val());
    return true;
  });

  $('#clave_plaza').on('change blur', function(e) {
    var obj = $(this);
    var val = obj.val();
    var url = '" . Url::to(['rh-plaza/get-id-plaza']) . "';
    console.log('clave_plaza cambió!');
    console.log ('Controlador: ' + url);
    if(val==='') {
      $('#id_plaza').val('');
    }
    else {
        jQuery.ajax(url, {
          'dataType': 'json',
          'method': 'get',
          'success': function(result) {
            console.log(result);
            $('#id_plaza').val(result.IdPlaza);
            // Ahora actualizar el campo Info para la nueva plaza
            actualizaDatosPlaza(result.IdPlaza);
          },
          'error': function(e) {
            console.log('Error: Plaza no válida!');
            $('#id_plaza').val('');
          },
          'cache': false,
          'data': {plaza: val},
        });
    }
  });

  ", \yii\web\View::POS_READY);
 ?>


<div class="rh-ausencia-form">
  <?php $form = ActiveForm::begin([
    'id'=>'frm_add_ausencia',
    'options'=>[
      'class'=>'form-horizontal',
    ],
    //'scrollToError'=>true,
  ]);
  ?>


<div class="container">

          <?= $form->field($model, 'clave_trab', [
            //'template'=>'<div class="row">{label}<div class="col-lg-2 col-md-2 col-sm-2">{input}</div><div class="col-lg-8 col-md-8 col-sm-8"></div></div><div class="row"><div class="col-lg-12 col-md-12">{error}{hint}</div></div>',
//            'addon'=>[
//              'append'=> [
//                'content'=>Html::button('<i class="glyphicon glyphicon-sunglasses"></i>', [
//                  'id'=>'btn_lookup_click',
//                  'class'=>'btn btn-default',
//                  'value'=>Url::to(['rh-trab/lookup']),
//                  'tabstop'=>-1,
//                ]),
//                'asButton'=>true,
//              ],
//
//            ],
          ])->textInput([
                  'id'=>'clave_trab',
                  'autofocus'=>'autofocus',
                  'tabstop'=>1,
                  'placeholder'=>'Ficha...',
                  'title'=>'Introduzca la ficha del trabajador',
              ]);
          ?>

          <?= $form->field($model, 'clave_plaza')->widget(\yii\jui\AutoComplete::classname(),[
            'name'=>'clave_plaza',
            'options'=>[
              'placeholder'=>'Plaza...',
              'id'=>'clave_plaza',
              'class'=>'form-control autocomoplete-input-bg-arrow',
              'tabstop'=>2,
              'title'=>'Plaza en la que se está ausentando el trabajador',
            ],
            'clientOptions'=>[
              'minLength'=>3,
              'type'=>'get',
              'source'=>Url::to(['rh-plaza/get-clave-plaza']),
              'select'=> new JsExpression('function(event, ui) {
                console.log("Valor = "+ui.item.value);
                console.log("Id = " + ui.item.id);
                $("#clave_plaza").val(ui.item.value);
                $("#id_plaza").val(ui.item.id);
              }'),
            ],
          ]);

           ?>
          <?= $form->field($model, 'id_plaza')->textInput([
              'name'=>'id_plaza',
              'id'=>'id_plaza',
              'tabstop'=>-1,
            ])->label(''); ?>

            <?= $form->field($model, 'id_motivo')->dropDownList(RhAusencia::listaIdsCobertura(), [
              'id'=>'id_motivo',
              'tabstop'=>4,
              'title'=>'Motivo por el cual se ausenta el trabajador',
              'onchange'=>'val=$(this).find("option:selected").text().split("-")[1]; $("#clave_motivo").val(val); console.log(val);',
            ]); ?>
          <?= $form->field($model, 'clave_motivo')->hiddenInput([
            'id'=>'clave_motivo',
            'value'=>'???',
            'tabstop'=>-1,
            ])->label(false);
          ?>

          <?= $form->field($model, 'fec_inicio')->widget(DateControl::classname(), [
              'ajaxConversion'=>true,
              'language'=>'es',
              'type'=>'date',
              'autoWidget'=>true,
              'widgetClass'=>'',
              'displayFormat'=>'php:d-M-Y',
              'saveFormat'=>'php:Y-m-d',
              'saveTimezone'=>'America/Mexico_City',
              'displayTimezone'=>'America/Mexico_City',
              'options'=>[
                  'tabstop'=>5,
                  'placeholder'=>$fechaDel,
                  'title'=>'Fecha en que inicia de la ausencia',
               ],
              'widgetOptions'=>[
                'removeButton'=>false,
                'type'=>DatePicker::TYPE_COMPONENT_APPEND,
                'pluginOptions'=> [
                  'autoclose'=>true,
                  'todayHighlight'=>true,
                  'todayBtn'=>false,
                  'calendarWeeks'=>true,
                  'daysOfWeekHighlighted'=>[0,6],
                ],
              ],
            ])
          ?>

            <?= $form->field($model, 'fec_termino')->widget(DateControl::classname(), [
                'ajaxConversion'=>true,
                'type'=>DateControl::FORMAT_DATE,
                //'type'=>'date',
                'autoWidget'=>true,
                'widgetClass'=>'',
                'displayFormat'=>'php:d-M-Y',
                'saveFormat'=>'php:Y-m-d',
                'saveTimezone'=>'America/Mexico_City',
                'displayTimezone'=>'America/Mexico_City',
                'options'=>[
                    'placeholder'=>$fechaAl,
                    'title'=>'Fecha en que termina la ausencia',
                    'tabstop'=>6,
                ],
                'language'=>'es',
                'widgetOptions'=>[
                  'removeButton'=>false,
                  //'mask'=>'99/99/9999',
                  'type'=>DatePicker::TYPE_COMPONENT_APPEND,
                  'pluginOptions'=> [
                    'autoclose'=>true,
                    'todayHighlight'=>true,
                    'todayBtn'=>false,
                    'calendarWeeks'=>true,
                    'daysOfWeekHighlighted'=>[0,6],
                  ],
                ],
                ])->label('Hasta el...'); ?>

        <?= $form->field($model, 'obs')->textArea([
          'id'=>'obs',
          'tabstop'=>8,
          'placeholder'=>'Observaciones y notas...',
          'title'=>'Datos adicionales',
          'style'=>'width: 100%;'])
        ?>

<div id="nombreTrab"></div>
<div id="info"></div>

        <?= Html::submitButton('Guardar', ['class' => 'btn btn-success', 'tabstop'=>7]) ?>

</div>

<?php ActiveForm::end(); ?>
