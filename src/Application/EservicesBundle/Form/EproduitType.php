<?php

namespace Application\EservicesBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;
use Symfony\Component\HttpFoundation\File\File;
use Doctrine\ORM\EntityRepository;
use  Application\EservicesBundle\Form\EproduitImageType;


class EproduitType extends AbstractType {

    public function buildForm(FormBuilderInterface $builder, array $options) {
        $builder
         /* ->add('geolocation', 'genemu_jquerygeolocation',array('mapped'=>false))*/
               /* $builder->add('address', new EproduitGmapType(),array(
                    
                'mapped'=>false)
                        )*/
                ->add('name')
                /* , 'genemu_jqueryautocomplete_entity', array(
                  'class' => 'Application\EservicesBundle\Entity\Eproduit',
                  'property' => 'name',
                  'configs' => array(
                  'minLength' => 0,
                  ),
                  )) */
                //  ->add('name',null,array('label'=>'Nom du Produit'))
                ->add('description', 'ckeditor', array(
                    'config_name' => 'my_config',
                ))
                ->add('shortdescription', 'textarea', array(
                    'label' => 'Résumé',
                    /*'attr' => array(
                  'cols' => "20",'rows'=>"5"),*/
                ))

                // ->add('services')
          /*      ->add('image')
                ->add('image', 'file', array(
                    'data_class' => 'Symfony\Component\HttpFoundation\File\File',
                    'property_path' => 'image',
                    'required' => false,
        ));*/
        
        ->add('image', new EproduitImageType(),array(
              'label'=>'Image',
              'required'=>false))
         
   
         ;           
          

        /* $builder->add('soccer_player', 'genemu_jqueryautocomplete_text', array(
          'suggestions' => array(
          'Ozil',
          'Van Persie'
          ),
          'mapped'=>false,
          )); */
        /* ->add('image', 'sonata_media_type', array(
          'provider' => 'sonata.media.provider.image',
          'context'  => 'default'
          )); */
        /*
         *  $builder->add('logo', 'sonata_media_type', array(
          'provider' => 'sonata.media.provider.image',
          'context'  => 'avatar'
          ));
         * 
         * 
         *  ->add('produit', 'entity', array(
          //'class' => 'Application\EservicesBundle\Entity\CertificatsProjet',
          'class' => 'ApplicationEservicesBundle:Eproduit',
          'query_builder' => function(EntityRepository $em) {
          return $em->createQueryBuilder('u')
          ->where
          ->orderBy('u.nom', 'ASC');
          },
         */
        $builder->add('categorie', 'entity', array(
                    //'class' => 'Application\EservicesBundle\Entity\CertificatsProjet',
                    'class' => 'ApplicationEservicesBundle:EproduitCategories',
                    'query_builder' => function(EntityRepository $em) {
                        return $em->createQueryBuilder('u')
                                ->orderBy('u.name', 'ASC');
                    },
                    'property' => 'name',
                    'multiple' => false,
                    'required' => true,
                    'label' => 'Categorie',
                    'empty_value' => '--- Choisir une option ---'
                ))
                ->add('idStatus', null, array('label' => 'Status'))
        /* ->add('image', 'file',
          array(
          'label' => 'Hast du ein Screenshot von der Nachricht'
          )
          ) */
        ;
    }

    public function setDefaultOptions(OptionsResolverInterface $resolver) {
        $resolver->setDefaults(array(
            'data_class' => 'Application\EservicesBundle\Entity\Eproduit'
        ));
    }

    public function getName() {
        return 'application_certificatsbundle_eproduittype';
    }

}
