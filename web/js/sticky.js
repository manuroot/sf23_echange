jQuery(document).ready(function(){
    /* This code is executed after the DOM has been completely loaded */
    /* $.zoomooz.setup({
        root:$("#sticky-notes"),
        targetsize:0.4        
    });*/
    /*$("#element").click(function(evt) {
        $(this).zoomTo({targetsize:0.75, duration:600});
        evt.stopPropagation();
    });*/
	
    
    
    /* $container.isotope({
           animationOptions: {
     duration: 750,
     easing: 'linear',
     queue: false
   },
        itemSelector: '.note'
      });*/
      
      
    var tmp;
    var min=1000;
    var zIndex=0;
    /*var myArray = [];*/
    var zdata = Array();
    // todo tableau des indexes
    $('.note').each(function(){
        /* Finding the biggest z-index value of the notes */
        tmp = $(this).css('z-index');
        zdata.push(tmp);
        $(this).css({
            'z-index':1
        });
        if(tmp>zIndex) zIndex = tmp;
    });
    
    
    /* zdata.sort(function(a, b) { return a - b });
    var i=0;
     $('.note').each(function(){
       tmp = $(this).css('z-index');
            zdata.push(tmp);
           $(this).css({
               'z-index':1
            });
        if(tmp>zIndex) zIndex = tmp;
  
    });*/
    /*   var items = $("#sticky-notes note").toArray();
items.sort(function(a, b) {
    return(Number(a.style.zIndex) - Number(b.style.zIndex));
});*/
    /*
     $(this).css({
               'z-index':maxZ+1
            });
*/
    // passer par function
    //  $('#note-modifier').live('click',function(e){
    /*  $('.note').live('click',function(e){*/
    /* 
    $('.note').mouseover(function()
{
   $(this).css("cursor","pointer");
   $(this).animate({width: "500px"}, 'slow');
});

$('.note').mouseout(function()
{
   $(this).animate({width: "200px"}, 'slow');
});

*/
    $('.note').mousedown(function(e){
        console.log( '$(this)', $(this) );
        console.log( '$(e.target)', $(e.target) );
        var maxZ = 0;
        // non ! pqe ca double
        $('.note').each(function(){
            var thisZ = parseInt($(this).css('z-index'))
            if(thisZ>maxZ) maxZ=thisZ;
        });
        console.log("maxZ=" + maxZ);
        /* $(this).css('z-index',500);
        zIndex=500;*/
        if($(e.target).hasClass("bar_titre"))
        {
            zIndex=maxZ+1;
            console.log("oki bar titre: zindex current=" + zIndex);
            $(this).css({
                'z-index':maxZ+1
            });
            /* $(e.target).css({
               'z-index':maxZ+1
            });*/
            
            console.log("a zindex current=" + zIndex);
        }
        else {
            zIndex=maxZ+1;
            console.log("oki bar titre: zindex current=" + zIndex);
            $(this).css({
                'z-index':maxZ+1
            });
        /*$(e.target).closest('.note').css({
                   zIndex:100
        });*/
        }
        /* $(e.target).css({
               'z-index':maxZ+1
            });*/
           
        /* zIndex=maxZ+1;*/
        console.log("final zindex current=" + zIndex);
    /* ui.helper.css('z-index',++zIndex);*/
    });
    /* $("#sticky-notes").mousedown(function(e){
         console.log( '$(this)', $(this) );
         console.log( '$(e.target)', $(e.target) );
          $("#sticky-notes").css({
               'z-index':zIndex
            });
            
         zIndex=maxZ+1;
         console.log("text final zindex current=" + zIndex);
        
    });*/
         
    function swapFirstLast(isFirst) {
        if(inAnimation) return false; //if already swapping pictures just return
        else inAnimation = true; //set the flag that we process a image
        var processZindex, direction, newZindex, inDeCrease; //change for previous or next image
        if(isFirst) {
            processZindex = z;
            direction = '-';
            newZindex = 1;
            inDeCrease = 1;
        } //set variables for "next" action
        else {
            processZindex = 1;
            direction = '';
            newZindex = z;
            inDeCrease = -1;
        } //set variables for "previous" action
        $('#pictures img').each(function() { //process each image
            if($(this).css('z-index') == processZindex) { //if its the image we need to process
                $(this).animate({
                    'top' : direction + $(this).height() + 'px'
                }, 'slow', function() { //animate the img above/under the gallery (assuming all pictures are equal height)
                    $(this).css('z-index', newZindex) //set new z-index
                    .animate({
                        'top' : '0'
                    }, 'slow', function() { //animate the image back to its original position
                        inAnimation = false; //reset the flag
                    });
                });
            } else { //not the image we need to process, only in/de-crease z-index
                $(this).animate({
                    'top' : '0'
                }, 'slow', function() { //make sure to wait swapping the z-index when image is above/under the gallery
                    $(this).css('z-index', parseInt($(this).css('z-index')) + inDeCrease); //in/de-crease the z-index by one
                });
            }
        });
        return false; //don't follow the clicked link
    }
    /*============================================================
    *     MODAL DELETE NOTE END
    *===========================================================*/     

    /*a Function to Initialise a Dialog instance for the modal box */
    function modal_message()
    {
        $("#dialog-message").dialog({
            modal: true,
            buttons: {
                Ok: function() {
                    $(this).dialog('destroy');
                    
                }
            }
        });
    }
/*====================================================
 * MAIN()
 ====================================================*/
    $("#dialog-message").hide();
    $("#confirmation_dialog").hide();

    console.log("recharge tout v1");
    reload_textarea();
    reload_sticky();
    make_draggable($('.note'));
    make_resizable($('.note'));
    console.log("recharge tout end");
    $('.note').trigger('click');
  

        
    $("#myaddButton").fancybox({
        'zoomSpeedIn'		: 500,
        'zoomSpeedOut'		: 500,
        'frameWidth':600,
        'easingIn'			: 'easeOutBack',
        'easingOut'			: 'easeInBack',
        openEffect  : 'fade',
        closeEffect : 'fade',
        'hideOnContentClick': false,
        'padding'			: 15
    //  'onClosed': function() { parent.location.reload(true);; }
    //   onCleanup   : function() {alert ('test2'); return window.location.reload(); }
    });
    
    $(".editnote").fancybox({
        'overlayShow'	: false,
        'transitionIn'	: 'elastic',
        'transitionOut'	: 'elastic',
        'padding' : 0,
        'hideOnContentClick': false,
                                       
        'padding'			: 15,
        'type':'iframe'
    });
          
    $("#orderButton").fancybox({
        'zoomSpeedIn'		: 600,
        'zoomSpeedOut'		: 500,
        'easingIn'			: 'easeOutBack',
        'easingOut'			: 'easeInBack',
        'hideOnContentClick': false,
        'padding'			: 15,
        'autoopen':false,
        'callbackOnClose' : function() {
            parent.location.reload(true);
        }
    });
    
                   
    /* Listening for keyup events on fields of the "Add a note" form: */
    $('.pr-body,.pr-author').live('keyup',function(e){
        if(!this.preview)
            this.preview=$('#fancy_ajax .note');
		
        /* Setting the text of the preview to the contents of the input field, and stripping all the HTML tags: */
        this.preview.find($(this).attr('class').replace('pr-','.')).html($(this).val().replace(/<[^>]+>/ig,''));
    });
	
    /* Changing the color of the preview note: */
    $('.color').live('click',function(){
        $('#fancy_ajax .note').removeClass('yellow green blue red').addClass($(this).attr('class').replace('color',''));
    });
	
    /* 
     * BOUTON SUBMIT
     * The submit button dans la modale form: */
    /*============================================================
    *     AJOUTER NOTE
    *     Ajout new note
    *     Bouton submit
    ===========================================================*/               
    function test_elements(){
      
        var status=true;
        if($('.pr-body').val().length<4)
        {
            alert("Ce texte est trop cours!")
            status=false;
        }
        else if($('.pr-author').val().length<1)
        {
            alert("You haven't entered your name!")
            status=false;
        }
        return status;

    }
    
    function get_datas(){
        var data = {
            'zindex'	: ++zIndex,
            'body'		: $('.pr-body').val(),
            'author'		: $('.pr-author').val(),
            'categories'      : $('.pr-categories').val(),
            'proprio'		: $('.pr-myuserid').val(),
            'color'		: $.trim($('#fancy_ajax .note').attr('class').replace('note',''))
        };
        return data;
    }
  
    $('#note-submit').live('click',function(e){
        var status=test_elements();	
        if (status==false){
            return false;
        }
           /*  <img src="{{ asset('bundles/applicationmynotes/images/edit.png') }}" alt="notes_edit" width="15" height="15" />*/
                  
        $(this).replaceWith('<img src="' +  '"/images/sticky/ajax_load.gif" style="margin:30px auto;display:block" />');
        var data=get_datas();
    

        /*============================================================
    *     ADD NOTE
    *     Ajout new note
     ===========================================================*/   
        $.ajax({
            type:     "POST",
            data:     data,
            url:      baseUrl + '/notes/edit',
            dataType: "json",
            async:    false,
            cache: false,
            success:  function(msg) {
                var tmp=create_note(data,msg);
                make_draggable(tmp);
                make_resizable(tmp);
            // return true;
            }
        });
        $("#myaddButton").fancybox.close();
        reload_editnote();
        reload_sticky();
        /* $.post(baseUrl + '/notes/edit',data,function(msg){
						 
            if(parseInt(msg))
            {
                var tmp=create_note(data,msg);
                make_draggable(tmp);
                make_resizable(tmp);
              
            }
			
            $("#myaddButton").fancybox.close();
            reload_editme();
            reload_sticky();
        });*/
		
        e.preventDefault();
    //   window.location.reload();
    })
	
    $('.note-form').live('submit',function(e){
        e.preventDefault();
    });
    /*============================================================
    *     EDIT NOTE
    *     
    *    Bouton notes-modifier
    ===========================================================*/               


    $('#note-modifier').live('click',function(e){
        var status=test_elements();	
        if (status==false){
            return false;
        }
        $(this).replaceWith('<img src="' + baseUrl + '"/images/sticky/ajax_load.gif" style="margin:30px auto;display:block" />');
        // datas a passer a l'action du controleur
        var data=get_datas();
        // valeur supplementaire: cas modifier
        data['id']= $('.pr-myid').val();
        /* console.log("myid=" + data['id']);
        console.log("body=" + data['body']);*/
        $.post(baseUrl + '/notes/editer',data,function(msg){
            //  console.log ("datas="+data['id']);
            if(parseInt(msg))
            {
                var tmp = $('#fancy_ajax .note').clone();
            }
            $("#editnote").fancybox.close();
            $("textarea#stickynote-"+data['id']).text(data['body']);
            $("#"+data['id'] + " .categories").text(msg['categories']);
            $("#"+data['id'] + " .author").text(data['author']);
            var color=$("#"+data['id']).attr('class','note '+data['color']);
        // console.log ("color_class="+color);
        });
		
        e.preventDefault();
        return;
    })
    var zIndex = 0;
    /*============================================================
    *     DRAGABLE
    ===========================================================*/               
  
    function make_draggable(elements)
    {
        /* Elements is a jquery object: */
        /*   var width = $(elements).css('width');
           var height = $(elements).css('height');*/
        /*  var id = $(this).find(attr("id"));*/
         
        elements.draggable({
            handle:$("div#center div.bar_titre"),
            snap: ".ui-widget-header",
            containment:$("#main"),
            /*  containment:'parent.parent',*/
            //'parent.parent',
            /*  animate: true,*/
            start:function(e,ui){
              
                ui.helper.css('z-index',++zIndex);
                /* ui.helper.css("width","50px");
                  ui.helper.css("height","50px");*/
                $(ui.helper).css("opacity", "0.7")
                console.log("drag zindex current=" + zIndex);
            },
            stop:function(e,ui){
                console.info('ui.helper.attr("id"):' + ui.helper.attr('id'));
                /*   console.log("id=",id);*/
                var dataAjax = {
                    id:  parseInt( ui.helper.attr('id')),
                    x: parseInt(ui.position.left),
                    y: parseInt(ui.position.top),
                    z: zIndex
       
        
                };
                /* $.post('{{path('AcmeHomeBundle_ajax_update_mydata')}}',               
                {data1: 'mydata1', data2:'mydata2'}, */
                $.ajax({
                     url: "/notes/updatepos", 
                    type: "POST", 
                    data : dataAjax, 
                    dataType: "json", 
                    success: function(reponse){
                    }
                });  //Eof:: ajax 
                $(ui.helper).css("opacity", "1");
            //remplacer bar titre
            // $notes .='<div class="bar_titre" style="width:' . $width . 'px;">';
            }
        });
              
   
    }

   
    /*============================================================
    *     RESIZABLE
    ===========================================================*/               

    function make_resizable(elements)
    {
        //getter

        elements.resizable({
            
            containment:$("#main"),
            /*  containment:'parent',*/
            /*   animate: true,*/
            /*    ghost:true,*/
            minHeight: 200,
            minWidth: 200,
            maxHeight: 350,
            maxWidth: 350,
            /*   animateEasing: "swing",*/
            /*  handles:"n, e, s, w",*/
            start:function(e,ui){
                ui.helper.css('z-index',++zIndex);
                $(ui.helper).css("opacity", "0.7")
            },
            stop:function(e,ui){
                    var dataAjax = {
                    id:  parseInt( ui.helper.attr('id')),
                    w		: parseInt(ui.size.width),
                    h		: parseInt(ui.size.height),
                    z		: zIndex
             };
             $.ajax({
                     url: "/notes/updatepos", 
                    type: "POST", 
                    data : dataAjax, 
                    dataType: "json", 
                    success: function(reponse){
                    }
                });  //Eof:: ajax 
                /* Sending the z-index and positon of the note to update_position.php via AJAX GET: */
                $(ui.helper).css("opacity", "1");
            }
        });
    }
	
   
    function fancyAlert(msg) {
        jQuery.fancybox({
            'modal' : true,
            'content' : "<div style=\"margin:1px;width:240px;\">"+msg+"<div style=\"text-align:right;margin-top:10px;\"><input style=\"margin:3px;padding:0px;\" type=\"button\" onclick=\"jQuery.fancybox.close();\" value=\"Ok\"></div></div>"
        });
    }

    function fancyConfirm(msg,callback) {
        var ret;
        jQuery.fancybox({
            modal : true,
            content : "<div style=\"margin:1px;width:240px;\">"+msg+"<div style=\"text-align:right;margin-top:10px;\"><input id=\"fancyConfirm_cancel\" style=\"margin:3px;padding:0px;\" type=\"button\" value=\"Cancel\"><input id=\"fancyConfirm_ok\" style=\"margin:3px;padding:0px;\" type=\"button\" value=\"Ok\"></div></div>",
            onComplete : function() {
                jQuery("#fancyConfirm_cancel").click(function() {
                    ret = false;
                    jQuery.fancybox.close();
                })
                jQuery("#fancyConfirm_ok").click(function() {
                    ret = true;
                    jQuery.fancybox.close();
                })
            },
            onClosed : function() {
                callback.call(this,ret);
            }
        });
    }
     
    function fancyConfirm_text() {
        fancyConfirm("Ceci est un test", function(ret) {
            alert(ret)
        })
    }


    function reload_sticky() {
        /*============================================================
    *     DELETE NOTE CLICK
    ===========================================================*/     
        $(".deltsticky").click(function(e) {
            e.preventDefault();
            var id = $(this).attr("id");
            var parent =   $(this).parent().parent();
            console.log (id) ; 
        

            $("#dialogbox").dialog({
                /*  effect: ("shake", { times: 5 }, 100),*/
                resizable: false,
                height:180,
                width:350,
                modal: true,
                autoOpen: false,
       
                buttons: {
                    "Oui": function() {
                        $( this ).dialog( "close" );
                        if (id != '') {
                            /*  baseUrl*/
                            /* $.post('/uzf04new/notes/delete',*/
                            $.post(baseUrl + '/notes/delete', 
                            {
                                'id' : id
                            }, 
                            function (respond) {
                                console.log ("reponse="+respond) ; 
        
                                if(parseInt(respond)){
                                    ////Display the success message in the modal box
                                    var msg="mon test";
                                    //   modal_message();
                                    $('#'+id).remove();
                                }
                                else {
                                    alert("probleme sur la suppression de "+id);
                                }
                            }
                            );
                             
                            $( this ).dialog( "close" );     
                        } 
              
                    },
                    Cancel: function() {
                        $( this ).dialog( "close" );
                    }
                }
            }); 
        
            $('#dialogbox').dialog('open');
            //Display confirmation Dialog when user clicks on "delete Image"
            return false;

        });
    }
     
    /*============================================================
    *     UPDATE TEXTAREA
    ===========================================================*/               
    function reload_textarea() {
        $('#sticky-notes').on('keyup', 'textarea', function(e){
            /*  $(e.parent).css({
               'z-index':500
            });*/
            console.log("text area zindex=" + zIndex);
            $(this).css('z-index',zIndex);
            /*$(this).parents('.note').css('z-index',zIndex);*/
            var $stickynote = $(this);
            var id = $stickynote.attr('id');
            /*  console.log("atr="+id);*/
            var update_content = $stickynote.val();
            /* console.log("content="+update_content);*/
            //recup de l'id :
            id = id.replace("stickynote-","");
            /*   console.log("atr="+id);*/
            $.post("notes/updatetext", {
                id: id,
                content: update_content
            },function(data){
                if(data.response == false){
                /* console.log('could not update');*/
                }
            }, 'json');

        });
    }
    function reload_editnote() {
        $("a#editnote").fancybox({
            'zoomSpeedIn'		: 500,
            'zoomSpeedOut'		: 500,
            'margin': 25,
            'easingIn'			: 'easeOutBack',
            'easingOut'			: 'easeInBack',
            openEffect  : 'fade',
            closeEffect : 'fade',
            'frameWidth':600,
            'frameHeight':600,
            'hideOnContentClick': false
     
        });
    }
    function create_note(data,msg) {
     
        var d= $('<div class="note ' + data['color'] + '" id="' + msg['id'] + '" '
            + 'style="padding-top:0px;  width:300px;height:300px; left: 100px;top:100px;z-index:' + zIndex + '">'
            + '<div class="bar_titre" style="width:100%;"></div>'
            + '<textarea class="area-note" id="stickynote-' + msg['id'] + '" width="200px;">' + data['body'] + '</textarea>'
            + ' <div class="categories">' + msg['categories'] +  '</div>'
            + ' <div class="author">' + data['author'] +  '</div>'
            + '<a class="editnote" href="notes/editer/id/' + msg['id'] + '" title="Note: ' + msg['id'] + '" id="page1-anchor">++</a>'
            +  '<div class="delnote"><a id="' + msg['id'] + '" class="deltsticky" href="#">x</a></div>'
            +  '<span class="data">'  + msg['id'] + '</span>'
            + '</div>');
        var main=$("#sticky-notes")
        d.appendTo(main);
        return d;
    }
    
    /* let the trash be droppable, accepting the gallery items*/
    $("#trash").droppable({
        accept: ".note",
        activeClass: "ui-state-highlight",
        drop: function( event, ui ) {
            ui.helper.css("width","100px");
            ui.helper.css("height","100px");
        /*}*/
        /* deleteImage( ui.draggable );*/
        }
    });
    // let the notes be droppable as well, accepting items from the trash
    $('.note').droppable({
        accept: "#trash",
        activeClass: "custom-state-active",
        drop: function( event, ui ) {
            recycleImage( ui.draggable );
        }
    });
    
    $( "#cart" ).droppable({
        accept: ".note",
        tolerance: "touch",  
        activeClass: "ui-state-highlight",
      
        drop: function( event, ui ) {
            ui.helper.css("width","50px");
            ui.helper.css("height","50px");

            ui.helper.css("top","0px");
            /* ui.helper.css("font-size","6px");*/
            /* $( this )
            .addClass( "ui-state-highlight" )
            .html( "Dropped!" );*/
            $.get(baseUrl + '/notes/updatesnap',{
                x		: ui.position.left,
                y		: 1,
                z		: zIndex,
                w		: 50,
                h		: 50,
                classement      : "mini",
                id	: parseInt(ui.helper.find('span.data').html())
            });
         
    
        }
    
    });
    $( "#snaptarget" ).droppable({
        accept: ".note",
        tolerance: "touch",  
        activeClass: "ui-state-highlight",
      
        drop: function( event, ui ) {
            ui.helper.css("width","50px");
            ui.helper.css("height","50px");

            ui.helper.css("top","0px");
            /* ui.helper.css("font-size","6px");*/
            /* $( this )
            .addClass( "ui-state-highlight" )
            .html( "Dropped!" );*/
            $.get(baseUrl + '/notes/updatesnap',{
                x		: ui.position.left,
                y		: 1,
                z		: zIndex,
                w		: 50,
                h		: 50,
                classement      : "mini",
                id	: parseInt(ui.helper.find('span.data').html())
            });
         
    
        }
    
    });
    /*  $("#snaptarget").each(function(){
       
        $("snaptarget > div").children().css({"font-size": "8px","color": "orange"}); 
    });*/
    /*  $("#snaptarget > .note").children().css({"font-size": "8px","color": "orange"});*/   
    /* $("#sticky-notes").children().css({"font-size": "8px","color": "orange"});   */
    $( "#center" ).droppable({
        accept: ".note",
        tolerance: "pointer",  
        activeClass: "ui-state-highlight",
      
        drop: function( event, ui ) {
            /*   $(this + ".note").css("width","250px");
                $(this + ".note").css("height","250px");*/
            /*  if(outside == 1){
            alert('Dropped outside!');
             }*/
        
        
            /* var wi=ui.size.width;
        var he=ui.size.height;*/
            /*if (wi < 100){
            ui.helper.css("width","250px");
            ui.helper.css("height","250px");
        }*/
            /* ui.helper.css("top","0px");*/
            /*  ui.helper.css("font-size","6px");*/
            /* $( this )
            .addClass( "ui-state-highlight" )
            .html( "Dropped!" );*/
            $.get(baseUrl + '/notes/updatesnap',{
                /*       w		: ui.size.width,
                    h		: ui.size.height,*/
                x		: ui.position.left,
                y		: ui.position.top,
                z		: zIndex,
                classement : "main",
           
                id	: parseInt(ui.helper.find('span.data').html())
            });
        }
    });
    
    
    function deleteImage( $item ) {
        $item.fadeOut(function() {
            var $list = $( "ul", $( "#trash" ) ).length ?
            $( "ul", $( "#trash" ) ) :
            $( "<ul class='gallery ui-helper-reset'/>" ).appendTo( $( "#trash" ));
            $item.find( "a.ui-icon-trash" ).remove();
            $item.append( recycle_icon ).appendTo( $list ).fadeIn(function() {
                $item
                .animate({
                    width: "48px"
                })
                .find( "img" )
                .animate({
                    height: "36px"
                });
            });
        });
    }
});