<?php

namespace Application\EservicesBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Application\EservicesBundle\Entity\Eproduit;
use Application\EservicesBundle\Entity\Person;
use Application\EservicesBundle\Form\EproduitType;
use Application\EservicesBundle\Form\EproduitGmapType;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Session\Session;
use Symfony\Component\Security\Core\Exception\AccessDeniedException;
use Symfony\Component\Security\Acl\Domain\ObjectIdentity;
use Symfony\Component\Security\Acl\Domain\UserSecurityIdentity;
use Symfony\Component\Security\Acl\Permission\MaskBuilder;
use JMS\SecurityExtraBundle\Annotation\Secure;
use Symfony\Component\HttpFoundation\JsonResponse;
use Pagerfanta\Pagerfanta;
use Pagerfanta\Adapter\DoctrineORMAdapter;
use Pagerfanta\Exception\NotValidCurrentPageException;
use Ivory\GoogleMap\Overlays\Animation;
use Ivory\GoogleMap\Overlays\Marker;
use Ivory\GoogleMap\Overlays\MarkerShape;
use Ivory\GoogleMap\Overlays\Circle;
use Ivory\GoogleMap\Overlays\InfoWindow;
use Ivory\GoogleMap\Events\MouseEvent;
use Ivory\GoogleMap\Overlays\Rectangle;
use Ivory\GoogleMap\Places\Autocomplete;
use Ivory\GoogleMap\Places\AutocompleteType;
use Ivory\GoogleMap\Helper\Places\AutocompleteHelper;
use Ivory\GoogleMap\Overlays\Polyline;

/**
 * Eproduit controller.
 *
 */
class PrefaillesController extends Controller {

    

    public function indexAction() {
        
          $em = $this->getDoctrine()->getManager();
        $map = $this->get('ivory_google_map.map');

        // Requests the ivory google map marker service
//$marker->setIcon('http://maps.gstatic.com/mapfiles/markers/marker.png');
// Configure your marker options
        $infoWindow = new InfoWindow();

// Configure your info window options
        $infoWindow->setPrefixJavascriptVariable('info_window_');
        $infoWindow->setPosition(0, 10, true);
        $infoWindow->setPixelOffset(1.1, 2.1, 'px', 'pt');
        $infoWindow->setContent('<p>Default content</p>');
        $infoWindow->setOpen(false);
        $infoWindow->setAutoOpen(true);
        $infoWindow->setOpenEvent(MouseEvent::CLICK);
        $infoWindow->setAutoClose(false);
        $infoWindow->setOption('disableAutoPan', true);
        $infoWindow->setOption('zIndex', 10);
        $infoWindow->setOptions(array(
            'disableAutoPan' => true,
            'zIndex' => 10,
        ));

        // recup des markers dans base table: Person
      /*  $array = array("a", "b", "c");
        $lat = 44.996;
        $arr_position = $em->getRepository('ApplicationEservicesBundle:Person')->myposition();
        foreach ($arr_position as $key => $value) {

            $marker = new Marker();
            $marker->setPrefixJavascriptVariable("marker$key_");
            $marker->setPosition($value[1], $value[0], true);
            $marker->setAnimation(Animation::DROP);

            $marker->setOption('clickable', true);
            $marker->setOption('flat', true);

            $marker->setOptions(array(
                'clickable' => true,
                'flat' => true,
                'title' => "'" . $value[2] . "'",
            ));
            /*
              print_r($arr_position );
              exit(1); */
//$marker->setPosition(45.996, 0.203, true);
//$marker->setContent('<p>Default content</p>');
//$marker->setInfoWindow($infoWindow);
            //  $lat +=2.0;
          /*  $map->addMarker($marker);
        }**/

        /* $marker3=$marker;
          $marker3->setPosition(41.996, 0.203, true);
          $map->addMarker($marker3); */



      /*  $polyline = new Polyline();

// Configure your polyline options
        $polyline->setPrefixJavascriptVariable('polyline_');

        $polyline->setOption('geodesic', true);
        $polyline->setOption('strokeColor', '#ffffff');
        $polyline->setOptions(array(
            'geodesic' => true,
            'strokeColor' => '#ffffff',
        ));

        $marker2 = new Marker();
        $marker2->setPrefixJavascriptVariable('marker2_');
        $marker2->setPosition(47.996, 0.203, true);
        $marker2->setAnimation(Animation::DROP);

        $marker2->setOption('clickable', true);
        $marker2->setOption('flat', true);

        $marker2->setOptions(array(
            'clickable' => true,
            'flat' => true,
            'title' => "sdfd"
        ));*/

//$marker2->setPosition(45.996, 0.203, true);
//$marker2->setContent('<p>Default content</p>');
       /* $map->addMarker($marker2);


// Add coordinates to your polyline
        $polyline->addCoordinate(45.996, 0.203, true);
        $polyline->addCoordinate(47.996, 0.203, true);
        $map->addPolyline($polyline);
*/
        /*
          $markerShape = new MarkerShape();

          // Configure your marker shape options
          $markerShape->setPrefixJavascriptVariable('marker_shape_');
          $markerShape->setType('poly');
          $markerShape->setCoordinates(array(1, 1, 1, -1, -1, -1, -1, 1));

          // If the marker shape type is "poly", you can add coordinate one by one
          $markerShape->addPolyCoordinates(1, 1);
         */


//$map->addInfoWindow($infoWindow);
// Add your info window to the marker

        /*
          $rectangle = new Rectangle();

          // Configure your rectangle options
          $rectangle->setPrefixJavascriptVariable('rectangle_');
          $rectangle->setBound(-1, -1, 1, 1, true, true);

          $rectangle->setOption('clickable', false);
          $rectangle->setOption('strokeColor', '#ffffff');
          $rectangle->setOptions(array(
          'clickable'   => false,
          'strokeColor' => '#ffffff',
          ));
          $map->addRectangle($rectangle); */
        /*
          // Add your marker shape to the marker
          $marker->setShape($markerShape); */
// Requests the ivory google map circle service
//$circle = $this->get('ivory_google_map.circle');

      /*  $circle = new Circle();
// Configure your circle options
        $circle->setPrefixJavascriptVariable('circle_');
        $circle->setCenter(45.996, 0.203, true);
        $circle->setRadius(80);

        $circle->setOptions(array(
            'clickable' => true,
            'strokeWeight' => 2,
        ));

        $map->addCircle($circle);

        $autocomplete = new Autocomplete();

        $autocomplete->setPrefixJavascriptVariable('place_autocomplete_');
        $autocomplete->setInputId('place_input');

        $autocomplete->setInputAttributes(array('class' => 'my-class'));
        $autocomplete->setInputAttribute('class', 'my-class');

        $autocomplete->setValue('Paris');

        $autocomplete->setTypes(array(AutocompleteType::CITIES));
        $autocomplete->setBound(-2.1, -3.9, 2.6, 1.4, true, true);

        $autocomplete->setAsync(false);
        $autocomplete->setLanguage('en');

        $autocompleteHelper = new AutocompleteHelper();*/

//echo $autocompleteHelper->renderHtmlContainer($autocomplete);
//echo $autocompleteHelper->renderJavascripts($autocomplete);
//$marker = $this->get('ivory_google_map.marker');
//$map->addRec;

 return $this->render('ApplicationEservicesBundle:Prefailles:index.html.twig', array(
      'map'=>$map
        ));
      

    }

}
