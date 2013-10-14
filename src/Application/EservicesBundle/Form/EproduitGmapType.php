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
                ->add('locality', 'hidden', array(
                    'required'      => false,
                ))
                ->add('country', 'hidden', array(
                    'required'      => false
                ))
                ->add('lat', 'hidden', array(
                    'required'      => false
                ))
                ->add('lng', 'hidden', array(
                    'required'      => false
                ))
        ;


    }
  public function getDefaultOptions(array $options){
   
   // public function setDefaultOptions(OptionsResolverInterface $resolver) {
         return array(
            'virtual'   => true, // Ici nous précisons que notre FormType est un champ virtuel
        );
    }

    public function getName() {
        return 'gmap_address';
    }

}
