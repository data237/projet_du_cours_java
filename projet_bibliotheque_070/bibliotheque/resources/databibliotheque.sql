PGDMP  8    :                 }            bibliotheque    17.2    17.2 $               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false                       1262    16553    bibliotheque    DATABASE     �   CREATE DATABASE bibliotheque WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'French_Cameroon.1252';
    DROP DATABASE bibliotheque;
                     postgres    false            �            1259    16554    emprunts    TABLE     �   CREATE TABLE public.emprunts (
    empruntid integer NOT NULL,
    membreid integer NOT NULL,
    livreid integer NOT NULL,
    dateemprunt date NOT NULL,
    dateretourprevue date NOT NULL,
    dateretoureffective date
);
    DROP TABLE public.emprunts;
       public         heap r       postgres    false            �            1259    16557    emprunts_empruntid_seq    SEQUENCE     �   CREATE SEQUENCE public.emprunts_empruntid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.emprunts_empruntid_seq;
       public               postgres    false    217                       0    0    emprunts_empruntid_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.emprunts_empruntid_seq OWNED BY public.emprunts.empruntid;
          public               postgres    false    218            �            1259    16558    livres    TABLE     8  CREATE TABLE public.livres (
    id integer NOT NULL,
    isbn character varying(13),
    titre character varying(255),
    auteur character varying(255),
    nationaliteauteur character varying(100),
    categorie character varying(100),
    dateparution character varying(10),
    nombreexemplaires integer
);
    DROP TABLE public.livres;
       public         heap r       postgres    false            �            1259    16563    livres_id_seq    SEQUENCE     �   CREATE SEQUENCE public.livres_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.livres_id_seq;
       public               postgres    false    219                       0    0    livres_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.livres_id_seq OWNED BY public.livres.id;
          public               postgres    false    220            �            1259    16564    membres    TABLE       CREATE TABLE public.membres (
    id integer NOT NULL,
    nom character varying(255) NOT NULL,
    prenom character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    telephone character varying(20) NOT NULL,
    adhesiondate date NOT NULL
);
    DROP TABLE public.membres;
       public         heap r       postgres    false            �            1259    16569    membres_id_seq    SEQUENCE     �   CREATE SEQUENCE public.membres_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.membres_id_seq;
       public               postgres    false    221                       0    0    membres_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.membres_id_seq OWNED BY public.membres.id;
          public               postgres    false    222            �            1259    16570 	   penalites    TABLE     �   CREATE TABLE public.penalites (
    penaliteid integer NOT NULL,
    empruntid integer NOT NULL,
    montant numeric(10,2) NOT NULL
);
    DROP TABLE public.penalites;
       public         heap r       postgres    false            �            1259    16573    penalites_penaliteid_seq    SEQUENCE     �   CREATE SEQUENCE public.penalites_penaliteid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.penalites_penaliteid_seq;
       public               postgres    false    223                       0    0    penalites_penaliteid_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.penalites_penaliteid_seq OWNED BY public.penalites.penaliteid;
          public               postgres    false    224            f           2604    16574    emprunts empruntid    DEFAULT     x   ALTER TABLE ONLY public.emprunts ALTER COLUMN empruntid SET DEFAULT nextval('public.emprunts_empruntid_seq'::regclass);
 A   ALTER TABLE public.emprunts ALTER COLUMN empruntid DROP DEFAULT;
       public               postgres    false    218    217            g           2604    16575 	   livres id    DEFAULT     f   ALTER TABLE ONLY public.livres ALTER COLUMN id SET DEFAULT nextval('public.livres_id_seq'::regclass);
 8   ALTER TABLE public.livres ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    220    219            h           2604    16576 
   membres id    DEFAULT     h   ALTER TABLE ONLY public.membres ALTER COLUMN id SET DEFAULT nextval('public.membres_id_seq'::regclass);
 9   ALTER TABLE public.membres ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    222    221            i           2604    16577    penalites penaliteid    DEFAULT     |   ALTER TABLE ONLY public.penalites ALTER COLUMN penaliteid SET DEFAULT nextval('public.penalites_penaliteid_seq'::regclass);
 C   ALTER TABLE public.penalites ALTER COLUMN penaliteid DROP DEFAULT;
       public               postgres    false    224    223                      0    16554    emprunts 
   TABLE DATA           t   COPY public.emprunts (empruntid, membreid, livreid, dateemprunt, dateretourprevue, dateretoureffective) FROM stdin;
    public               postgres    false    217   �)       
          0    16558    livres 
   TABLE DATA           x   COPY public.livres (id, isbn, titre, auteur, nationaliteauteur, categorie, dateparution, nombreexemplaires) FROM stdin;
    public               postgres    false    219   �+                 0    16564    membres 
   TABLE DATA           R   COPY public.membres (id, nom, prenom, email, telephone, adhesiondate) FROM stdin;
    public               postgres    false    221   G3                 0    16570 	   penalites 
   TABLE DATA           C   COPY public.penalites (penaliteid, empruntid, montant) FROM stdin;
    public               postgres    false    223   �9                  0    0    emprunts_empruntid_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.emprunts_empruntid_seq', 52, true);
          public               postgres    false    218                       0    0    livres_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.livres_id_seq', 50, true);
          public               postgres    false    220                       0    0    membres_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.membres_id_seq', 69, true);
          public               postgres    false    222                       0    0    penalites_penaliteid_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.penalites_penaliteid_seq', 15, true);
          public               postgres    false    224            k           2606    16579    emprunts emprunts_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.emprunts
    ADD CONSTRAINT emprunts_pkey PRIMARY KEY (empruntid);
 @   ALTER TABLE ONLY public.emprunts DROP CONSTRAINT emprunts_pkey;
       public                 postgres    false    217            m           2606    16581    livres livres_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.livres
    ADD CONSTRAINT livres_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.livres DROP CONSTRAINT livres_pkey;
       public                 postgres    false    219            o           2606    16583    membres membres_email_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.membres
    ADD CONSTRAINT membres_email_key UNIQUE (email);
 C   ALTER TABLE ONLY public.membres DROP CONSTRAINT membres_email_key;
       public                 postgres    false    221            q           2606    16585    membres membres_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.membres
    ADD CONSTRAINT membres_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.membres DROP CONSTRAINT membres_pkey;
       public                 postgres    false    221            s           2606    16587    penalites penalites_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.penalites
    ADD CONSTRAINT penalites_pkey PRIMARY KEY (penaliteid);
 B   ALTER TABLE ONLY public.penalites DROP CONSTRAINT penalites_pkey;
       public                 postgres    false    223            t           2606    16588    emprunts emprunts_livreid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.emprunts
    ADD CONSTRAINT emprunts_livreid_fkey FOREIGN KEY (livreid) REFERENCES public.livres(id) ON DELETE CASCADE;
 H   ALTER TABLE ONLY public.emprunts DROP CONSTRAINT emprunts_livreid_fkey;
       public               postgres    false    217    4717    219            u           2606    16593    emprunts emprunts_membreid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.emprunts
    ADD CONSTRAINT emprunts_membreid_fkey FOREIGN KEY (membreid) REFERENCES public.membres(id) ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.emprunts DROP CONSTRAINT emprunts_membreid_fkey;
       public               postgres    false    217    221    4721            v           2606    16598 "   penalites penalites_empruntid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.penalites
    ADD CONSTRAINT penalites_empruntid_fkey FOREIGN KEY (empruntid) REFERENCES public.emprunts(empruntid) ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.penalites DROP CONSTRAINT penalites_empruntid_fkey;
       public               postgres    false    217    4715    223               �  x�m�[n�0D�a/����DW������@�<H���DH����1Ĕ��
/V��g�P���I~2]����E~ҶZ�^l����Fn/v��LW��9�$?ik���r��LW��p:�&?i�[��d�T����9�i��p%(����L��њ�{P���"(�j{�m�� s�UCm��vVʶu��ӷ�CohAh�M�&�AP�z�X?5�55��m�W�B:bK�|�--�7�F��Τ�e��
�t���W��Tc�m�*���C� H�f�;�
���j��
�Lk����$fn�� 騁��S	z �`���+z @j :x.� �l��<7A�L_Q� �|��IP�����EP!��f̛���x���-�%= �PθS	z Bck�@HGp��#j ��=��k� DB9�+������7 f��!���7 ��w�5����5 2]���nK��6,<�5��q�M��·���?���RU      
   e  x���KR�H�ǩUd�����H=36on쨊��I"%R^RJW*�F��^A���^I�)�G�0Q7�@�����$;L�0���a��D���h֔\������)��������a��dQ	�Z��'A�#<��^�ï�4&�\���ĥ$���C%��w}����� �"'FHV�^
))�s�?���� gL���W��I���E�D�ɕ0?1�iw���Q�D|/v�F�1Z]n�j�Qt"K���ꖬ*U���Щ�5o�G�7��%R}?����z���4�.�9�E��c!�JhEo
F.�Z5}'�h7C�RGa���؉��+��F�Т�Qtc���K�eF���In>j�q4�c4��w���%[޴�z���g�5Jo�·]�t� �u�L�k�*�0-�y����gњe����߶&���Q���KI��y�Wf��d�4�P���
z�zY^�$��-��֖v'yK~9rE���_~:�P�г9}�����K!�Z@����զ�u��7�/t�ۜi���0�=�){�ܧ�>�f��ȶB��������VF}���6 Hz�JXU�N�&�3U��3`a�U�Y]2C0Y�˦3�~��tۓ����\1z�:t��Κтub����Q��������T�m�Q<��4>~���S���p$��{�C���f%1�Ķœ�]����-�-m�*D�n~}jʚ�1�v�"I �!�]����mS/p�lvTK.�1jz�Q�-L�����j?t��d�c[1��^�:Qɔ�G��9���;��Ț$��Z�Z� T�@
"/p���N���Pq� S�i��F�j�P8l�?~�*t��3���No9�ٝװ��Kz�𠉔?;bB�m������h��i�������3Hp�K��: ��)�@�
ϾUú;��߻~��DR^�pR������$Fa��:� )�ݺi%A����Bu�N_�[p���6�H>�@{	aa��ְ�����Ufm"O��	�NZ|X<�I�������6M�,�^Tc(���]Y�Ū*����gW�t���&�|GPAd����Nhʜ�5&��E8ͥ��r��mvT���t(�'��57�i�~��yo�:Þ�;�,{`O��AVva�����	�a[����Gdj]�Ý�'��q�ʹ.9 ׹��Й���G�39 ��QR��ӱ��^� PW��K��AOʶcZJ�Df�=�Uc��~��O�EEZ�vG��{d�ZX�PW��|}!G\�[���jxq��`�4{���?�_���W(L��{�|��=�[<���A�N�a�ž�k��og?����˅1\z�������b�Xo�̥h7�
z��t0xI� ���qV��1����%3��Z�o�)�Ϭ�DBᰑ���Ŝq3�?��_��w��^��T�8Wh*Y��x��Ѯ�r��K1���t�0tH��1����H��*k\�ڊ�V��?n��!	��x�r��5�I�m1)�,Z{M�T�\�>��C]i��M�C��qL�y?�WmWv��7�ݗ���3ľ+y����Mu�G�����SO�bI.7��z���w��-p��S A�?:�<�\�v��)׏��8&��5+%w�?����é;`[��-J��R��nK�8vp����O��7�4���@���C ����%J���DI�l��p;��v��Q�WWx��d�u��	��G������$�nE��rf_��(4��^keW��t8*hO�}��go겍p ȶ�����A��B��>��L�ww�� ��p�|���w8Q�f8�/�������ͺ=D&ɻ'$o����]�.��Bb
����������y�y��         m  x�uW�r�8<�E(|H��;�fco*v��$�,>\��E�����mH�r��C�E{�)]��Qך�m�i�E���o�o�<�Fn��T�\&y���(I%*[$˅J���ݸ�t��햶|��	wn�r޽Z(%2����v�E�/?zk�Y�Q�!L�PV3L�P���F�;M�ښ�]����K������B墠��_�lM=.�;�w���dޙ.T!J�=t�n�ѝn�}GGd;eC��A�3�Z�R,�~��-����G��Okhoj�9L� %M��k�'Y�]=vc�Og��A%k���k6DIH6��YV�r�>tG��6���r$�P"�1���D�����s���0�ו��V�9�b�Y"Ҕn�����n=LQ6밮�O�E�ϥY����5(A�� ÑA|����H3�>h�����P�4�|n.Q���<2]���]@�D_�#'z$�EZ��7���G�6um��i��x�z<E�$�HK&Y7vt����O4L�9�t�5A9D���nzK��+G�l�t �<��g��HW�ѰoMߢa�a��#M�<��m��H+��v#&׍��.j\��K�>S�$�P	]�OGC�� nYMO�B�ݍ��Bi�O�s7��n�w�v�	�g΄>W�,B)��<ޡ��v|���5��Y�����F�)Cw��Yۖ�S���[!���b�fB�t�^`~n�w���&�X�3�\��P�D?tgMӸd��u�H�J�dj�;��/�@;m䚓!�GV�MZ
��[�v���[��+p* ���Z-ҥP+�h�]�����	|�&�t%����1��L�g)�C��h��Y��nZ7����1�S�t��PQYi��@�{��[4?m]�<��p�OҔ�>Sܸ�����X�m3/�sq#��ɪ��c��4~�>�����4.��$�X�Q��C�bi�hz���H� >Is���`��E!OSd��t�Ӵ`��J�j����Y��B~�|�3�d���T<<��c��St��L��u� �Xe�e2P?�Ԁd�k���?��1������w������K��
y7WTWQ�v�p��τ?�Aڂ����ǖ�z�u��L�B(��,2��Y���w:^����KY^�ȳ�=L^h6B�p��Д�?Ϲ�X�ǝsufܱ�k�Qc��$U��(��$D<�6n�m� ��S�S�Y*�P�����!�Oќ�?_��cw�v�,~�E�����*B���B�����U�r������u"N����)yl���"������0��Uā)��Ȏ��
��"�
I<tp�3$~�EN� E迊#�=|��f�������
�q`E	�3��������*�
V��Dw���.�U�5�*�����8�'���v.H�T�=ⷊW6��u�i��_�1�
��M�s��d����9tZE�j�{�����"n��*�JpR�T��@k���X�#�L�O�X�MG���+;���U�J����3���̃����2c�z��j2\`�z
�k1We��X����>�""VI�\�]lq�N7#^�肄
=H1Ue�������d\��P�R`���g%ܺd�ΨT�`BMƇ�6�]2r�>'>c5�ƂJ8Bm�c���4�ȹ,;'�J�%���"G1         X   x�=���0��b<��^�!C��+qHQ�H)���tF�``'x2�n������p2U�g�(��Õ�l�@;��|
��R��     