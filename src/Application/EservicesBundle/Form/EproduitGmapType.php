<?php

namespace Application\EservicesBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;


class EproduitGmapType extends AbstractType {

    public function buildForm(FormBuilderInterface $builder, array $options) {
        $builder
                ->add('address', null, array(
                    'required'      => true,
                )) 
                ->add('locality', 'text', array(
                      'read_only' => true,
                   /* 'disabled' => true,*/
                    'required'      => false,
                ))
                ->add('country', 'text', array(
                     'read_only' => true,
                    'required'      => false
                ))
                ->add('lat', 'text', array(
                      'read_only' => true,
                   /*  'disabled' => true,*/
                    'required'      => false
                ))
                ->add('lng', 'text', array(
                      'read_only' => true,
                    /* 'disabled' => true,*/
                    'required'      => false
                ))
        ;


    }
    
    public function setDefaultOptions(OptionsResolverInterface $resolver)
    {
          $resolver->setDefaults(array(
            'data_class' => 'Application\EservicesBundle\Entity\Person'
        ));
        /*$resolver->setDefaults(array(
            'inherit_data' => true
        ));*/
    }
  /*public function getDefaultOptions(array $options){
   
   // public function setDefaultOptions(OptionsResolverInterface $resolver) {
         return array(
            'virtual'   => true, // Ici nous précisons que notre FormType est un champ virtuel
        );
    }*/

    public function getName() {
        return 'gmap_address';
    }

}
