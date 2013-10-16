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
class EproduitController extends Controller {
    /* ====================================================================
     *
     * CREATION DU PAGINATOR
     *
      =================================================================== */

    private function createpaginator($query, $num_perpage = 5, $session_page = null) {

        $request = $this->getRequest();
        // $session = $request->getSession();
        $pagename = 'page'; // Set custom page variable name

        $page = $request->query->get($pagename, 1);
        $paginator = $this->get('knp_paginator');
        $pagination = $paginator->paginate(
                $query, $page, $num_perpage, array(
            'pageParameterName' => $pagename,
            'distinct' => true,
            "sortDirectionParameterName" => "dir",
            'sortFieldParameterName' => "sort")
        );
        // $total=$pagination->getTotalItemCount();
        $pagination->setTemplate('ApplicationEservicesBundle:pagination:twitter_bootstrap_pagination.html.twig');
        $pagination->setSortableTemplate('ApplicationEservicesBundle:pagination:sortable_link.html.twig');
        return $pagination;
    }

    private function mypager($adapter = null, $max = 5, $page = 1) {
        if (isset($adapter)) {
            $pagerfanta = new Pagerfanta($adapter);
            $pagerfanta->setMaxPerPage($max);

            return $pagerfanta;
        } else {
            return null;
        }
    }

    private function getuserid() {
        $em = $this->getDoctrine()->getManager();
        $user_security = $this->container->get('security.context');
        // authenticated REMEMBERED, FULLY will imply REMEMBERED (NON anonymous)
        if ($user_security->isGranted('IS_AUTHENTICATED_FULLY')) {
            $user = $this->get('security.context')->getToken()->getUser();
            $user_id = $user->getId();
            $group = $user->getIdgroup();
            if (isset($group)) {
                $group_id = $group->getId();
            } else {
                $group_id = 0;
            }
        } else {
            $user_id = 0;
            $group_id = 0;
        }


        // }else {
        return array($user_id, $group_id);
        //   }
    }

    /**
     * Lists all Eproduit entities.
     *
     */
    public function indexAction() {

        $em = $this->getDoctrine()->getManager();
        list($user_id, $group_id) = $this->getuserid();
        $session = $this->getRequest()->getSession();
        $session->set('buttonretour', 'eproduit');

        $querya = $em->getRepository('ApplicationEservicesBundle:Eproduit')->myFindAll($user_id);
        $queryBuildera = $querya->getQuery();
        $pagenamea = 'page1'; // Set custom page variable name

        $pagea = $this->get('request')->query->get($pagenamea, 1);
        $paginatora = $this->get('knp_paginator');
        $paginationa = $paginatora->paginate(
                $querya, $pagea, 2, array(
            'pageParameterName' => $pagenamea,
            'distinct' => true,
            "sortDirectionParameterName" => "dir1",
            'sortFieldParameterName' => "sort1")
        );
        // $total=$pagination->getTotalItemCount();
        $paginationa->setTemplate('ApplicationEservicesBundle:pagination:twitter_bootstrap_pagination.html.twig');





        /*
          $queryb = $em->getRepository('ApplicationEservicesBundle:Eproduit')->myFindOtherAll($user_id,$group_id);
          $queryBuilderb = $queryb->getQuery();
          $paginationb = $this->createpaginator($queryBuilderb, 5);
         */

        /*  $paginator = $this->get('knp_paginator');
          //   $query = $em->getRepository('ApplicationEservicesBundle:Eproduit')->findAll();
          $pagename1 = 'page1'; // Set custom page variable name
          $page1 = $this->get('request')->query->get($pagename1, 1); // Get custom page variable
          $paginationa = $paginator->paginate(
          $query, $page1, 3, array('pageParameterName' => $pagename1,
          "sortDirectionParameterName" => "dir1",
          'sortFieldParameterName' => "sort1")
          );
         */
        $query_other = $em->getRepository('ApplicationEservicesBundle:Eproduit')->myFindOtherAll($user_id, $group_id);

        $paginator = $this->get('knp_paginator');
        $pagename2 = 'page2'; // Set another custom page variable name
        $page2 = $this->get('request')->query->get($pagename2, 1); // Get another custom page variable
        $paginationb = $paginator->paginate(
                $query_other, $page2, 3, array('pageParameterName' => $pagename2,
            "sortDirectionParameterName" => "dir2",
            'sortFieldParameterName' => "sort2")
        );
        $paginationb->setTemplate('ApplicationEservicesBundle:pagination:twitter_bootstrap_pagination.html.twig');

        //$query = $em->getRepository('ApplicationEservicesBundle:CertificatsCenter')->myFindaAll();
        //  $paginationa->setTemplate('ApplicationEservicesBundle:pagination:twitter_bootstrap_pagination.html.twig');
        //  $paginationb->setTemplate('ApplicationEservicesBundle:pagination:twitter_bootstrap_pagination.html.twig');
        //  $pagination->setTemplate('ApplicationEservicesBundle:pagination:sliding.html.twig');
        return $this->render('ApplicationEservicesBundle:Eproduit:index.html.twig', array(
                    'paginationa' => $paginationa,
                    'paginationb' => $paginationb,
        ));
    }

    /**
     * @Secure(roles="ROLE_ADMIN")
     */
    public function indexAllAction() {
        $em = $this->getDoctrine()->getManager();
        list($user_id, $group_id) = $this->getuserid();
        $session = $this->getRequest()->getSession();
        $session->set('buttonretour', 'eproduit_indexadmin');
        $query = $em->getRepository('ApplicationEservicesBundle:Eproduit')->myFind();
        $pagination = $this->createpaginator($query, 5);
        $pagination->setTemplate('ApplicationEservicesBundle:pagination:twitter_bootstrap_pagination.html.twig');

        return $this->render('ApplicationEservicesBundle:Eproduit:template_index.html.twig', array(
                    'pagination' => $pagination,
                    'iseditable' => 'no'
        ));
    }

    /**
     *
     */
    public function indexmesproduitsAction() {

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
        $array = array("a", "b", "c");
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
            $map->addMarker($marker);
        }

        /* $marker3=$marker;
          $marker3->setPosition(41.996, 0.203, true);
          $map->addMarker($marker3); */



        $polyline = new Polyline();

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
        ));

//$marker2->setPosition(45.996, 0.203, true);
//$marker2->setContent('<p>Default content</p>');
        $map->addMarker($marker2);


// Add coordinates to your polyline
        $polyline->addCoordinate(45.996, 0.203, true);
        $polyline->addCoordinate(47.996, 0.203, true);
        $map->addPolyline($polyline);

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

        $circle = new Circle();
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

        $autocompleteHelper = new AutocompleteHelper();

//echo $autocompleteHelper->renderHtmlContainer($autocomplete);
//echo $autocompleteHelper->renderJavascripts($autocomplete);
//$marker = $this->get('ivory_google_map.marker');
//$map->addRec;



        list($user_id, $group_id) = $this->getuserid();
        $session = $this->getRequest()->getSession();
        $session->set('buttonretour', 'eproduit_mesproduits');
        $query = $em->getRepository('ApplicationEservicesBundle:Eproduit')->myFindAll($user_id);
        $pagination = $this->createpaginator($query, 2);
        //return $this->render('ApplicationEservicesBundle:Eproduit:indexmesproduits.html.twig');
        return $this->render('ApplicationEservicesBundle:Eproduit:template_index.html.twig', array(
                    'pagination' => $pagination,
                    'iseditable' => 'yes',
                    'map' => $map,
                        // 'autocomplete'=>$autocomplete,
        ));
    }

    public function indexpropositionsAction() {

        $em = $this->getDoctrine()->getManager();
        list($user_id, $group_id) = $this->getuserid();
        $session = $this->getRequest()->getSession();
        $session->set('buttonretour', 'eproduit_propositions');
        $query = $em->getRepository('ApplicationEservicesBundle:Eproduit')->myFindOtherAll($user_id, $group_id);
        $pagination = $this->createpaginator($query, 2);
        return $this->render('ApplicationEservicesBundle:Eproduit:template_index.html.twig', array(
                    'pagination' => $pagination,
                    'iseditable' => 'no'
        ));
    }

    /**
     * Creates a new Eproduit entity.
     *
     */
    public function createAction(Request $request) {
        $entity = new Eproduit();
        $form = $this->createForm(new EproduitType(), $entity);
        $form->bind($request);
        list($user_id, $group_id) = $this->getuserid();
        $session = $this->getRequest()->getSession();
        //  $session->get('buttonretour', 'eproduit');
        $myretour = $session->get('buttonretour');

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $current_user = $em->getRepository('ApplicationSonataUserBundle:User')->find($user_id);
            $entity->setProprietaire($current_user);
            $entity->setUpdatedAt(new \DateTime());
            $em->persist($entity);
            $em->flush();

            $session = $this->getRequest()->getSession();
            $nom_modif = $entity->getName();
            $id = $entity->getId();
            $session->getFlashBag()->add('warning', "Enregistrement $nom_modif ($id) ajouté");
            return $this->redirect($this->generateUrl('eproduit_show', array('id' => $entity->getId())));
        }

        return $this->render('ApplicationEservicesBundle:Eproduit:new.html.twig', array(
                    'entity' => $entity,
                    'btnretour' => $myretour,
                    'form' => $form->createView(),
        ));
    }

    /**
     * Displays a form to create a new Eproduit entity.
     *
     */
    public function newAction() {
        $entity = new Eproduit();
        /*
          $helper = $this->container->get('vich_uploader.templating.helper.uploader_helper');
          $path = $helper->asset($entity, 'image'); */
        $form = $this->createForm(new EproduitType(), $entity);
        $session = $this->getRequest()->getSession();
        $myretour = $session->get('buttonretour');
        return $this->render('ApplicationEservicesBundle:Eproduit:new.html.twig', array(
                    'entity' => $entity,
                    'btnretour' => $myretour,
                    'form' => $form->createView(),
        ));
    }

    public function newmapAction() {
        $entity = new Person();
        /*
          $helper = $this->container->get('vich_uploader.templating.helper.uploader_helper');
          $path = $helper->asset($entity, 'image'); */
        $form = $this->createForm(new EproduitGmapType(), $entity);
        $session = $this->getRequest()->getSession();
        $myretour = $session->get('buttonretour');
        return $this->render('ApplicationEservicesBundle:Eproduit:newmap.html.twig', array(
                    'entity' => $entity,
                    'btnretour' => $myretour,
                    'form' => $form->createView(),
        ));
    }

    /**
     * Creates a new Eproduit entity.
     *
     */
    public function createmapAction(Request $request) {
        $entity = new Person();
        $session = $this->getRequest()->getSession();
        $em = $this->getDoctrine()->getManager();

        $myretour = $session->get('buttonretour');

        $form = $this->createForm(new EproduitGmapType(), $entity);
        $form->bind($request);

        //$postData = $form->getData();
        // print_r($request);

        if ($form->isValid()) {
            //  exit(1);
            $entity->setFirstName("erdsfsdf");
            $entity->setLastName("rzerxcc");
            $em->persist($entity);
            $em->flush();

            $id = $entity->getId();
            $session->getFlashBag()->add('warning', "Enregistrement ($id) ajouté");
            return $this->redirect($this->generateUrl('eproduit_newmap', array('id' => $entity->getId())));
        }

        return $this->render('ApplicationEservicesBundle:Eproduit:newmap.html.twig', array(
                    'entity' => $entity,
                    'btnretour' => $myretour,
                    'form' => $form->createView(),
        ));
    }

    public function editmapAction($id) {

        $request = $this->get('request');
        $em = $this->getDoctrine()->getManager();
        $entity = $em->getRepository('ApplicationEservicesBundle:Person')->find($id);
        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Eproduit entity.');
        }
        $session = $this->getRequest()->getSession();
        $myretour = $session->get('buttonretour');
        $form = $this->createForm(new EproduitGmapType(), $entity);

        if ($request->getMethod() == 'POST') {
            $form->bind($request);
            if ($form->isValid()) {
                $em->persist($entity);
                $em->flush();
                $id = $entity->getId();
                $session->getFlashBag()->add('warning', "Enregistrement ($id) ajouté");
                return $this->redirect($this->generateUrl('eproduit_newmap', array('id' => $entity->getId())));
            }
        }


        return $this->render('ApplicationEservicesBundle:Eproduit:editmap.html.twig', array(
                    'entity' => $entity,
                    'btnretour' => $myretour,
                    'form' => $form->createView(),
                        //  'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Finds and displays a Eproduit entity.
     *
     */
    public function showAction($id) {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('ApplicationEservicesBundle:Eproduit')->myFindId($id);
        $helper = $this->container->get('vich_uploader.templating.helper.uploader_helper');
//$path = $helper->asset($entity, 'image');
        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Eproduit entity.');
        }

        /*  $comments = $em->getRepository('ApplicationEservicesBundle:EproduitComments')
          ->getCommentsForProduit($entity->getId());
         */

        $session = $this->getRequest()->getSession();
        $myretour = $session->get('buttonretour');

        $deleteForm = $this->createDeleteForm($id);

        return $this->render('ApplicationEservicesBundle:Eproduit:show.html.twig', array(
                    'entity' => $entity,
                    'btnretour' => $myretour,
                    //'comments'  => $comments,
                    //   'path' => $path,
                    'delete_form' => $deleteForm->createView(),));
    }

    /**
     * Displays a form to edit an existing Eproduit entity.
     *
     */
    public function editAction($id) {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('ApplicationEservicesBundle:Eproduit')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Eproduit entity.');
        }
        $session = $this->getRequest()->getSession();
        $myretour = $session->get('buttonretour');

        list($user_id, $group_id) = $this->getuserid();
        $proprietaire = $entity->getProprietaire()->getId();
        if ($user_id != $proprietaire) {
            return $this->render('ApplicationEservicesBundle:Eservice:deny.html.twig', array(
            ));
        }

        $editForm = $this->createForm(new EproduitType(), $entity);
        $deleteForm = $this->createDeleteForm($id);

        return $this->render('ApplicationEservicesBundle:Eproduit:edit.html.twig', array(
                    'entity' => $entity,
                    'btnretour' => $myretour,
                    'edit_form' => $editForm->createView(),
                    'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Edits an existing Eproduit entity.
     *
     */
    public function updateAction(Request $request, $id) {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('ApplicationEservicesBundle:Eproduit')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Eproduit entity.');
        }

        $deleteForm = $this->createDeleteForm($id);
        $editForm = $this->createForm(new EproduitType(), $entity);
        $editForm->bind($request);
        $session = $this->getRequest()->getSession();
        $myretour = $session->get('buttonretour');
        if (!isset($myretour))
            $myretour = 'eproduit';
        if ($editForm->isValid()) {
            $entity->setUpdatedAt(new \DateTime());
            $em->persist($entity);
            $em->flush();

            $session->getFlashBag()->add('warning', "Enregistrement $id update successfull");
            $route_back = $session->get('buttonretour');
            if (isset($route_back))
                return $this->redirect($this->generateUrl($route_back, array('id' => $id)));
            else
                return $this->redirect($this->generateUrl('eproduit', array('id' => $id)));
        }

        return $this->render('ApplicationEservicesBundle:Eproduit:edit.html.twig', array(
                    'entity' => $entity,
                    'btnretour' => $myretour,
                    'edit_form' => $editForm->createView(),
                    'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Deletes a Eproduit entity.
     *
     */
    public function deleteAction(Request $request, $id) {
        $form = $this->createDeleteForm($id);
        $form->bind($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $entity = $em->getRepository('ApplicationEservicesBundle:Eproduit')->find($id);

            if (!$entity) {
                throw $this->createNotFoundException('Unable to find Eproduit entity.');
            }

            $em->remove($entity);
            $em->flush();
        }

        return $this->redirect($this->generateUrl('eproduit'));
    }

    /**
     * Creates a form to delete a Eproduit entity by id.
     *
     * @param mixed $id The entity id
     *
     * @return Symfony\Component\Form\Form The form
     */
    private function createDeleteForm($id) {
        return $this->createFormBuilder(array('id' => $id))
                        ->add('id', 'hidden')
                        ->getForm()
        ;
    }

    public function searchProduitAction() {
        $request = $this->getRequest();

        if ($request->isXmlHttpRequest() && $request->getMethod() == 'POST') {
            $em = $this->getDoctrine()->getEntityManager();
            $id = '';
            $applis = array();
            $cert_app = array();

            $id = $request->request->get('id_projet');
            $projet = $em->getRepository('ApplicationEservicesBundle:CertificatsProjet')->find($id);

            $id_cert = $request->request->get('id_cert');
            if (isset($id_cert) && $id_cert != "create") {
                //    var_dump($id_cert);
                $cert = $em->getRepository('ApplicationEservicesBundle:CertificatsCenter')->find($id_cert);
                foreach ($cert->getIdapplis() as $appli) {
                    array_push($cert_app, $appli->getId());
                }
                $applis['cert'] = $cert_app;
            }
            foreach ($projet->getIdapplis() as $appli) {
                //$applis[] = array($appli);
                $applis['applis'][$appli->getId()] = $appli->getNomapplis();
                //      $applis[] = array($appli->getId(), $appli->getNomapplis());
            }

            //    $appli=array(3,4);
            $response = new Response(json_encode($applis));
            $response->headers->set('Content-Type', 'application/json');

            return $response;
        }
        // return new Response();
    }

    public function indexsearchAction() {

        $em = $this->getDoctrine()->getManager();
        list($user_id, $group_id) = $this->getuserid();
        $session = $this->getRequest()->getSession();
        $session->set('buttonretour', 'eproduit_indexserch');

        $query = $em->getRepository('ApplicationEservicesBundle:Eproduit')->myFindAll($user_id);
        $query_other = $em->getRepository('ApplicationEservicesBundle:Eproduit')->myFindOtherAll($user_id, $group_id);
        $paginator = $this->get('knp_paginator');
        //   $query = $em->getRepository('ApplicationEservicesBundle:Eproduit')->findAll();
        $pagename1 = 'page1'; // Set custom page variable name
        $page1 = $this->get('request')->query->get($pagename1, 1); // Get custom page variable
        $paginationa = $paginator->paginate(
                $query, $page1, 3, array('pageParameterName' => $pagename1)
        );

        $pagename2 = 'page2'; // Set another custom page variable name
        $page2 = $this->get('request')->query->get($pagename2, 1); // Get another custom page variable
        $paginationb = $paginator->paginate(
                $query_other, $page2, 3, array('pageParameterName' => $pagename2)
        );
        //$query = $em->getRepository('ApplicationEservicesBundle:CertificatsCenter')->myFindaAll();

        $paginationa->setTemplate('ApplicationEservicesBundle:pagination:twitter_bootstrap_pagination.html.twig');
        $paginationb->setTemplate('ApplicationEservicesBundle:pagination:twitter_bootstrap_pagination.html.twig');
        //  $pagination->setTemplate('ApplicationEservicesBundle:pagination:sliding.html.twig');
        return $this->render('ApplicationEservicesBundle:Eproduit:search.html.twig', array(
                    'paginationa' => $paginationa,
                    'paginationb' => $paginationb,
        ));
        ;
    }

    public function mediaAction(Request $request) {
// preset a default value
        $media = $this->get('sonata.media.manager.media')->create();
        $media->setBinaryContent('http://www.youtube.com/watch?v=qTVfFmENgPU');

// create the target object
        $mediaPreview = new MediaPreview();
        $mediaPreview->setMedia($media);

// create the form
        $builder = $this->createFormBuilder($mediaPreview);
        $builder->add('media', 'sonata_media_type', array(
            'provider' => 'sonata.media.provider.youtube',
            'context' => 'default'
        ));

        $form = $builder->getForm();

// bind and transform the media's binary content into real content
        if ($request->getMethod() == 'POST') {
            $form->bindRequest($request);

            $this->getSeoPage()
                    ->setTitle($media->getName())
                    ->addMeta('property', 'og:description', $media->getDescription())
                    ->addMeta('property', 'og:type', 'video')
            ;
        }

        return $this->render('SonataDemoBundle:Demo:media.html.twig', array(
                    'form' => $form->createView(),
                    'media' => $mediaPreview->getMedia()
        ));
    }

    /**
     * @return \Sonata\SeoBundle\Seo\SeoPageInterface
     */
    public function getSeoPage() {
        return $this->get('sonata.seo.page');
    }

}
