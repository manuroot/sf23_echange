<?php
// src/Acme/DemoBundle/Form/EventListener/AddNameFieldSubscriber.php

namespace Application\EservicesBundle\Form\EventListener;


use Symfony\Component\Form\FormEvent;
use Symfony\Component\Form\FormEvents;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;

class AddImageFieldSubscriber implements EventSubscriberInterface
{
    public static function getSubscribedEvents()
    {
        // Tells the dispatcher that you want to listen on the form.pre_set_data
        // event and that the preSetData method should be called.
        return array(FormEvents::PRE_SET_DATA => 'preSetData');
    }

    public function preSetData(FormEvent $event)
    {
        $data = $event->getData();
        $form = $event->getForm();

        // check if the product object is "new"
        // If you didn't pass any data to the form, the data is "null".
        // This should be considered a new "Product"
        
        
        if (!$data || !$data->getId()) {
            //creation
             $form->add('file','file',array('label'=>'Fichier (*)','required'=>true,));
         
        }else {
            // update
                   $form->add('file','file',array('label'=>'Fichier','required'=>false));
        }
    }
}

