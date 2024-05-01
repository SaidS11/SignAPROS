PGDMP                 
        |            ModularLocal    13.2    13.2 D    7           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            8           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            9           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            :           1262    25181    ModularLocal    DATABASE     k   CREATE DATABASE "ModularLocal" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Mexico.1252';
    DROP DATABASE "ModularLocal";
                postgres    false                        3079    25182    pgcrypto 	   EXTENSION     <   CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;
    DROP EXTENSION pgcrypto;
                   false            ;           0    0    EXTENSION pgcrypto    COMMENT     <   COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';
                        false    2            �            1259    25219    algoritmos_ia    TABLE     Q   CREATE TABLE public.algoritmos_ia (
    nombre character varying(40) NOT NULL
);
 !   DROP TABLE public.algoritmos_ia;
       public         heap    postgres    false            �            1259    25222    analisis    TABLE     �   CREATE TABLE public.analisis (
    nombre character varying(40) NOT NULL,
    descripcion character varying(100),
    resultado character varying(200),
    protocolo_nombre character varying(40),
    modelo integer
);
    DROP TABLE public.analisis;
       public         heap    postgres    false            �            1259    25225    configuracion    TABLE       CREATE TABLE public.configuracion (
    nombre character varying(40) NOT NULL,
    gsr boolean,
    frecuencia_cardiaca boolean,
    temperatura boolean,
    emgs smallint,
    acelerometro boolean,
    subido boolean,
    descripcion character varying(100),
    arduinos integer
);
 !   DROP TABLE public.configuracion;
       public         heap    postgres    false            �            1259    25228    doctor    TABLE     A  CREATE TABLE public.doctor (
    usuario character varying(40) NOT NULL,
    password text NOT NULL,
    email character varying(70),
    telefono character varying(10),
    fecha_nacimiento date,
    nombre character varying(30),
    apellido_paterno character varying(50),
    apellido_materno character varying(50)
);
    DROP TABLE public.doctor;
       public         heap    postgres    false            �            1259    25234    filtros    TABLE     �   CREATE TABLE public.filtros (
    nombre character varying(40) NOT NULL,
    descripcion character varying(100),
    valores json
);
    DROP TABLE public.filtros;
       public         heap    postgres    false            �            1259    25240    implementacion    TABLE     !  CREATE TABLE public.implementacion (
    id integer NOT NULL,
    nombre character varying(50),
    descripcion character varying(100),
    algoritmo_ia character varying(40),
    parametros json,
    "precision" integer,
    desviacion_estandar double precision,
    entrenado boolean
);
 "   DROP TABLE public.implementacion;
       public         heap    postgres    false            �            1259    25246    implementacion_id_seq    SEQUENCE     �   CREATE SEQUENCE public.implementacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.implementacion_id_seq;
       public          postgres    false    206            <           0    0    implementacion_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.implementacion_id_seq OWNED BY public.implementacion.id;
          public          postgres    false    207            �            1259    25248    modelo    TABLE     �   CREATE TABLE public.modelo (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    algoritmo_ia character varying(40) NOT NULL,
    protocolo character varying(40) NOT NULL,
    entrenado boolean NOT NULL,
    resultados json
);
    DROP TABLE public.modelo;
       public         heap    postgres    false            �            1259    25254    modelo_id_seq    SEQUENCE     �   CREATE SEQUENCE public.modelo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.modelo_id_seq;
       public          postgres    false    208            =           0    0    modelo_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.modelo_id_seq OWNED BY public.modelo.id;
          public          postgres    false    209            �            1259    25256 
   multimedia    TABLE     �   CREATE TABLE public.multimedia (
    nombre character varying(40),
    link_video character varying(150) NOT NULL,
    link_imagen character varying(150) NOT NULL,
    subido boolean,
    configuracion character varying(40)
);
    DROP TABLE public.multimedia;
       public         heap    postgres    false            �            1259    25259    paciente    TABLE     �  CREATE TABLE public.paciente (
    usuario character varying(40) NOT NULL,
    email character varying(70),
    telefono character varying(10),
    fecha_nacimiento date,
    nombre character varying(30),
    apellido_paterno character varying(50),
    apellido_materno character varying(50),
    sexo character varying(10),
    peso double precision,
    estatura double precision
);
    DROP TABLE public.paciente;
       public         heap    postgres    false            �            1259    25262    protocolo_adquisicion    TABLE     �   CREATE TABLE public.protocolo_adquisicion (
    nombre character varying(40) NOT NULL,
    doctor character varying(40),
    configuracion character varying(40),
    descripcion character varying(100)
);
 )   DROP TABLE public.protocolo_adquisicion;
       public         heap    postgres    false            �            1259    25265    registro    TABLE     �   CREATE TABLE public.registro (
    id integer NOT NULL,
    datos_crudos json,
    fecha date,
    paciente character varying(40),
    protocolo_adquisicion character varying(40)
);
    DROP TABLE public.registro;
       public         heap    postgres    false            �            1259    25271    registro_id_seq    SEQUENCE     �   CREATE SEQUENCE public.registro_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.registro_id_seq;
       public          postgres    false    213            >           0    0    registro_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.registro_id_seq OWNED BY public.registro.id;
          public          postgres    false    214            �            1259    25273     relacion_analisis_implementacion    TABLE     �   CREATE TABLE public.relacion_analisis_implementacion (
    id integer NOT NULL,
    analisis character varying(40),
    implementacion integer
);
 4   DROP TABLE public.relacion_analisis_implementacion;
       public         heap    postgres    false            �            1259    25276 '   relacion_analisis_implementacion_id_seq    SEQUENCE     �   CREATE SEQUENCE public.relacion_analisis_implementacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.relacion_analisis_implementacion_id_seq;
       public          postgres    false    215            ?           0    0 '   relacion_analisis_implementacion_id_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public.relacion_analisis_implementacion_id_seq OWNED BY public.relacion_analisis_implementacion.id;
          public          postgres    false    216            ~           2604    25278    implementacion id    DEFAULT     v   ALTER TABLE ONLY public.implementacion ALTER COLUMN id SET DEFAULT nextval('public.implementacion_id_seq'::regclass);
 @   ALTER TABLE public.implementacion ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    207    206                       2604    25279 	   modelo id    DEFAULT     f   ALTER TABLE ONLY public.modelo ALTER COLUMN id SET DEFAULT nextval('public.modelo_id_seq'::regclass);
 8   ALTER TABLE public.modelo ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    208            �           2604    25280    registro id    DEFAULT     j   ALTER TABLE ONLY public.registro ALTER COLUMN id SET DEFAULT nextval('public.registro_id_seq'::regclass);
 :   ALTER TABLE public.registro ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    213            �           2604    25281 #   relacion_analisis_implementacion id    DEFAULT     �   ALTER TABLE ONLY public.relacion_analisis_implementacion ALTER COLUMN id SET DEFAULT nextval('public.relacion_analisis_implementacion_id_seq'::regclass);
 R   ALTER TABLE public.relacion_analisis_implementacion ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215            %          0    25219    algoritmos_ia 
   TABLE DATA           /   COPY public.algoritmos_ia (nombre) FROM stdin;
    public          postgres    false    201   yT       &          0    25222    analisis 
   TABLE DATA           \   COPY public.analisis (nombre, descripcion, resultado, protocolo_nombre, modelo) FROM stdin;
    public          postgres    false    202   �T       '          0    25225    configuracion 
   TABLE DATA           �   COPY public.configuracion (nombre, gsr, frecuencia_cardiaca, temperatura, emgs, acelerometro, subido, descripcion, arduinos) FROM stdin;
    public          postgres    false    203    U       (          0    25228    doctor 
   TABLE DATA           �   COPY public.doctor (usuario, password, email, telefono, fecha_nacimiento, nombre, apellido_paterno, apellido_materno) FROM stdin;
    public          postgres    false    204   �U       )          0    25234    filtros 
   TABLE DATA           ?   COPY public.filtros (nombre, descripcion, valores) FROM stdin;
    public          postgres    false    205   �V       *          0    25240    implementacion 
   TABLE DATA           �   COPY public.implementacion (id, nombre, descripcion, algoritmo_ia, parametros, "precision", desviacion_estandar, entrenado) FROM stdin;
    public          postgres    false    206   �V       ,          0    25248    modelo 
   TABLE DATA           \   COPY public.modelo (id, nombre, algoritmo_ia, protocolo, entrenado, resultados) FROM stdin;
    public          postgres    false    208   �W       .          0    25256 
   multimedia 
   TABLE DATA           \   COPY public.multimedia (nombre, link_video, link_imagen, subido, configuracion) FROM stdin;
    public          postgres    false    210   DX       /          0    25259    paciente 
   TABLE DATA           �   COPY public.paciente (usuario, email, telefono, fecha_nacimiento, nombre, apellido_paterno, apellido_materno, sexo, peso, estatura) FROM stdin;
    public          postgres    false    211   vY       0          0    25262    protocolo_adquisicion 
   TABLE DATA           [   COPY public.protocolo_adquisicion (nombre, doctor, configuracion, descripcion) FROM stdin;
    public          postgres    false    212   �[       1          0    25265    registro 
   TABLE DATA           \   COPY public.registro (id, datos_crudos, fecha, paciente, protocolo_adquisicion) FROM stdin;
    public          postgres    false    213   t\       3          0    25273     relacion_analisis_implementacion 
   TABLE DATA           X   COPY public.relacion_analisis_implementacion (id, analisis, implementacion) FROM stdin;
    public          postgres    false    215   ko       @           0    0    implementacion_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.implementacion_id_seq', 8, true);
          public          postgres    false    207            A           0    0    modelo_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.modelo_id_seq', 29, true);
          public          postgres    false    209            B           0    0    registro_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.registro_id_seq', 9, true);
          public          postgres    false    214            C           0    0 '   relacion_analisis_implementacion_id_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.relacion_analisis_implementacion_id_seq', 1, false);
          public          postgres    false    216            �           2606    25284     algoritmos_ia algoritmos_ia_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.algoritmos_ia
    ADD CONSTRAINT algoritmos_ia_pkey PRIMARY KEY (nombre);
 J   ALTER TABLE ONLY public.algoritmos_ia DROP CONSTRAINT algoritmos_ia_pkey;
       public            postgres    false    201            �           2606    25286    analisis analisis_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.analisis
    ADD CONSTRAINT analisis_pkey PRIMARY KEY (nombre);
 @   ALTER TABLE ONLY public.analisis DROP CONSTRAINT analisis_pkey;
       public            postgres    false    202            �           2606    25288     configuracion configuracion_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.configuracion
    ADD CONSTRAINT configuracion_pkey PRIMARY KEY (nombre);
 J   ALTER TABLE ONLY public.configuracion DROP CONSTRAINT configuracion_pkey;
       public            postgres    false    203            �           2606    25290    doctor doctor_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.doctor
    ADD CONSTRAINT doctor_pkey PRIMARY KEY (usuario);
 <   ALTER TABLE ONLY public.doctor DROP CONSTRAINT doctor_pkey;
       public            postgres    false    204            �           2606    25292    filtros filtros_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.filtros
    ADD CONSTRAINT filtros_pkey PRIMARY KEY (nombre);
 >   ALTER TABLE ONLY public.filtros DROP CONSTRAINT filtros_pkey;
       public            postgres    false    205            �           2606    25294 "   implementacion implementacion_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.implementacion
    ADD CONSTRAINT implementacion_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.implementacion DROP CONSTRAINT implementacion_pkey;
       public            postgres    false    206            �           2606    25296    paciente paciente_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.paciente
    ADD CONSTRAINT paciente_pkey PRIMARY KEY (usuario);
 @   ALTER TABLE ONLY public.paciente DROP CONSTRAINT paciente_pkey;
       public            postgres    false    211            �           2606    25298    modelo pk_modelo 
   CONSTRAINT     R   ALTER TABLE ONLY public.modelo
    ADD CONSTRAINT pk_modelo PRIMARY KEY (nombre);
 :   ALTER TABLE ONLY public.modelo DROP CONSTRAINT pk_modelo;
       public            postgres    false    208            �           2606    25300 0   protocolo_adquisicion protocolo_adquisicion_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.protocolo_adquisicion
    ADD CONSTRAINT protocolo_adquisicion_pkey PRIMARY KEY (nombre);
 Z   ALTER TABLE ONLY public.protocolo_adquisicion DROP CONSTRAINT protocolo_adquisicion_pkey;
       public            postgres    false    212            �           2606    25302    registro registro_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.registro
    ADD CONSTRAINT registro_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.registro DROP CONSTRAINT registro_pkey;
       public            postgres    false    213            �           2606    25304 F   relacion_analisis_implementacion relacion_analisis_implementacion_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.relacion_analisis_implementacion
    ADD CONSTRAINT relacion_analisis_implementacion_pkey PRIMARY KEY (id);
 p   ALTER TABLE ONLY public.relacion_analisis_implementacion DROP CONSTRAINT relacion_analisis_implementacion_pkey;
       public            postgres    false    215            �           2606    25305    implementacion fk_algoritmo_ia    FK CONSTRAINT     �   ALTER TABLE ONLY public.implementacion
    ADD CONSTRAINT fk_algoritmo_ia FOREIGN KEY (algoritmo_ia) REFERENCES public.algoritmos_ia(nombre);
 H   ALTER TABLE ONLY public.implementacion DROP CONSTRAINT fk_algoritmo_ia;
       public          postgres    false    2947    201    206            �           2606    25310 ,   relacion_analisis_implementacion fk_analisis    FK CONSTRAINT     �   ALTER TABLE ONLY public.relacion_analisis_implementacion
    ADD CONSTRAINT fk_analisis FOREIGN KEY (analisis) REFERENCES public.analisis(nombre);
 V   ALTER TABLE ONLY public.relacion_analisis_implementacion DROP CONSTRAINT fk_analisis;
       public          postgres    false    2949    215    202            �           2606    25315    multimedia fk_configuracion    FK CONSTRAINT     �   ALTER TABLE ONLY public.multimedia
    ADD CONSTRAINT fk_configuracion FOREIGN KEY (configuracion) REFERENCES public.configuracion(nombre);
 E   ALTER TABLE ONLY public.multimedia DROP CONSTRAINT fk_configuracion;
       public          postgres    false    210    203    2951            �           2606    25320 &   protocolo_adquisicion fk_configuracion    FK CONSTRAINT     �   ALTER TABLE ONLY public.protocolo_adquisicion
    ADD CONSTRAINT fk_configuracion FOREIGN KEY (configuracion) REFERENCES public.configuracion(nombre);
 P   ALTER TABLE ONLY public.protocolo_adquisicion DROP CONSTRAINT fk_configuracion;
       public          postgres    false    212    203    2951            �           2606    25325    protocolo_adquisicion fk_doctor    FK CONSTRAINT     �   ALTER TABLE ONLY public.protocolo_adquisicion
    ADD CONSTRAINT fk_doctor FOREIGN KEY (doctor) REFERENCES public.doctor(usuario);
 I   ALTER TABLE ONLY public.protocolo_adquisicion DROP CONSTRAINT fk_doctor;
       public          postgres    false    204    2953    212            �           2606    25330 2   relacion_analisis_implementacion fk_implementacion    FK CONSTRAINT     �   ALTER TABLE ONLY public.relacion_analisis_implementacion
    ADD CONSTRAINT fk_implementacion FOREIGN KEY (implementacion) REFERENCES public.implementacion(id);
 \   ALTER TABLE ONLY public.relacion_analisis_implementacion DROP CONSTRAINT fk_implementacion;
       public          postgres    false    206    215    2957            �           2606    25335    registro fk_paciente    FK CONSTRAINT     |   ALTER TABLE ONLY public.registro
    ADD CONSTRAINT fk_paciente FOREIGN KEY (paciente) REFERENCES public.paciente(usuario);
 >   ALTER TABLE ONLY public.registro DROP CONSTRAINT fk_paciente;
       public          postgres    false    213    2961    211            �           2606    25340    analisis fk_protocolo    FK CONSTRAINT     �   ALTER TABLE ONLY public.analisis
    ADD CONSTRAINT fk_protocolo FOREIGN KEY (protocolo_nombre) REFERENCES public.protocolo_adquisicion(nombre);
 ?   ALTER TABLE ONLY public.analisis DROP CONSTRAINT fk_protocolo;
       public          postgres    false    2963    212    202            �           2606    25345 !   registro fk_protocolo_adquisicion    FK CONSTRAINT     �   ALTER TABLE ONLY public.registro
    ADD CONSTRAINT fk_protocolo_adquisicion FOREIGN KEY (protocolo_adquisicion) REFERENCES public.protocolo_adquisicion(nombre);
 K   ALTER TABLE ONLY public.registro DROP CONSTRAINT fk_protocolo_adquisicion;
       public          postgres    false    2963    212    213            �           2606    25350    modelo modelo_algoritmo_ia_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.modelo
    ADD CONSTRAINT modelo_algoritmo_ia_fkey FOREIGN KEY (algoritmo_ia) REFERENCES public.algoritmos_ia(nombre);
 I   ALTER TABLE ONLY public.modelo DROP CONSTRAINT modelo_algoritmo_ia_fkey;
       public          postgres    false    2947    201    208            �           2606    25355    modelo modelo_protocolo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.modelo
    ADD CONSTRAINT modelo_protocolo_fkey FOREIGN KEY (protocolo) REFERENCES public.protocolo_adquisicion(nombre);
 F   ALTER TABLE ONLY public.modelo DROP CONSTRAINT modelo_protocolo_fkey;
       public          postgres    false    212    2963    208            %   Z   x�JMQ�K--��K��r,J��QHIUpIM�,�<�9��7��43/$�_�_T����\�_�	T��뗚X�Z\4#3=#)��+F��� G��      &      x������ � �      '   �   x�e��
�0���S�	��x�����x�״�vf��o�9v��?|�%_ϙ^x�&��`k�!IݴF�1X�2��c��HC�*d�"=A˄����N4*ђ*`�$)S�Wۇ7aV�b�q���&�'Gue�}��}{��	���194Q���n��)���/gA�����Qb      (   �   x�E��N�@����)\�e�(�]���j��T�f�������61&�����:U�t.tj�u��,��\�aK7��R�!�3F��[��r?���G4#qR�p[,�Z�$���4Mka;�G�y5�۾��כ�#6Ŭ��1c~�'��_ǧMr��-'�	�Ǹ]���L��g�g�|Ο�9)v6��ɲl�yf��s
�Rf0fPV�����!F9
X�E��h��M�P�      )      x������ � �      *   �   x���=�0�������!1w`�L�B�*��tB��#p1ܟ�R�=?�Kqr7�G��IE���hH��>�V{�y�M�P@�$�"��HE��;$��_PΠ�Z�܋���ԉ���R��{�8��tɫf�Y^g��M=�f�:�7ΈI��t�>:$��/~�shb�Zm���=�J�b{D�H)���nB      ,   �   x�32�(*MMJ�t,J��QHIUpIM�,�<�9��9?� '�$����Z)�&�d�df����fc�&'�� y�J�\F��~��e�F�4Ӑ�$����i�1~\Ff*�o�߱ ������3-9�S��R�a&�f<���`��1z\\\ eı@      .   "  x���MK1���_� �$�E�i�Aa��x��f����LҊ���Z��=��w�w�b�q��^s�t�4ќ�-2t��8�y!vD�Lrp�<���5�Fc��PJ��o61Q����J0!�\�B0�d�k��տ����"k�y��,�V���P�&�zm��)���V�+dF��6h��
�h:E*!�;{@�7�:���0�7���=RF9���bB1���Bp�8C�I�=����&vH�3=�&����B�L�_��Ω���؛������'ώX{a�v�
fСz�UU}j���      /   N  x�uT]o�0|���I����!H��04]�������v��׏R��I[ @B�x�#/n�{�am%��P��4u\��LR��E��".�D�C��]e��N��J7�5��,�E
"�fzt�{�X�h�D�L�E*A�eq	���c��ʶ4�����m����l��s��\J�ܨ_>�-e$d�S�>��Ί�2N<u^�~��"�z�G�o��D��B�&bU�����؇EW��fN2�JyZt��clL}��+QY�¦s�g�
�|G��Ч��L������l�g��D���ö���G���X~��ߓb�
0X����QF6T���2C�iH�3s��d18�ō~�de����(�'���΍/��3� �	�Ю���a8U�7�cDē�B����E��ƫhNg�	�V��L����~KWG~����gt;r0QB��A��~��k_| ��EB��`��9���3��(�b�t��h�<�=ҥ�����'���9g���i�[�LEW�N�L����_����������۷���r�k�G˺����ړq.��e�ȠTL�/PXֺ��7��3���w�      0   �   x�uO��0����<:B#@L,N�!R�4��D�`9���>y/>:���)%�:�
�Yb�\�$YFq��^���Q�8L�����z�w<�$�w˥K��'b�5
�<춧����yʟЪ�����3R�b;l8�7 �5(b�      1      x���K�%����ݿ����A򼒳5���G�;�[��=��ww�_d�BW��G�̌��z���w_?~���K��?>����]/~���x��l���}�����Oo����o_�������?�����������ۏ�/���%���������'����я[����o��{~(����񡡫/{e�W���˽��\|�H�^^�>�[/�����w��6��zm�Y��.�'�~L���_kǇ�А�|{��v�c��yc�9�=֞��=?y�av}c}f��Xߞo�Ђ?�Υ{^h-�Z��W�\�y��i�+X���Ӊ5�kN����2O���g��Z���C��;5����ͦ&�'r#c�f{�__Y�9^�APn
�ȹ���8�T���&ZN"����3������Êz�r�[h�[Nn}��\����7ȦێЎWSW� +��%r��z唧�22�)Z'�{N��o�4|f��Y��xC����7��7��NК�3�����~�ѹ�0�"����"P��ⴹf�L2=+\)�ZS6J���kM�r��eg�~��UA�ΏX�ʝ���SW��+��"���\��*�=x�L��Vs�?V��|�ae]�5f���ٌ�^�5�T��d�$������g��]91r$e������5���� Mg@9��v(����~�jj��5���%_Y����&�%R9�w�Z��	��+��xw���k�~	�;Ѽ\B�Ʊߥ�P��)����}|w��V�Y˭_6<)&���ݰ5�gͻ�V��h�����:4�,�g)�9�ǃh��<���X�u6�eR0���%��C��j7gtd�7%_ce�Ok��T��r�P�4���R������U���Mk5 �=;̯�J��ė��N����{���o5�P��n�ϼ��ٺ��k�me�<�a!��~9��t!�O�7��[k��^�r=)L(�!�H�ޮ�_�!�s�C$��`#�$D�u�h@D��:2ZH��>����[�R${��,��?� ��n�ţ���=ѫ��U#H_9�����_k�4��n�\\dt�n�Zߩ�3Ѥ^`�.F��I,dgU������ۮ�e>��C�^�D4�|Pc"n������A2�z0�gůy�y�!�TWV	fG� +�S�o6E��hX��+����RY�a���݀ �o��A�nX��!�Ѣ�s;"�%-���أ���&��_�`�^��s_\�mҫ���{~&ha#��R�Y����Ѥ�+��{<��s�}70 ��Q@�h�\��� �z���ݓD�D������ƻ �({�վ>�3��v��bݘJ�~$��8��sTE+�S�|�k�	y��W{���CH�2�mj/T�~)B���1 q��]�*�0kz��E���sh C��A�*�2A���@w���8�Ik&�������P��|Ŀ��vb�l��Ԫ���1�oC�z�S]�^Q�R���^��#PC�2_���e�q��if/;	�4���$q�-\{���w���l������}y����v���������0�V�,×�� z��!��l��*���!�&q�"�^L�^a-s�Fȡ���vW	+�}C�)2����<5�PP	Se�v!6-?u-2/{�3>hx���O��<;�٬�V���$?Q��p�z�=C�4g0e�]��0��1e�̓�*d�/no�7tP��j��$���������P�~V	&��lY�L�O����R_��|J@y*��)`\�EAB�\������VW�j�g=��c��GI��P�6ݱ�e�}DY��َ&T@��Y�Kqu�A?�v#�]��qv��(	���c��&{j�O��l�㛐�� �����~m���L��������䴂'"�;pu�@��vt�
J���P�g�2s\�_��WFy=��כ
T�{��K'��<ފ�2��c�_��1�"z��ʮɰ�t��w2�/�b�?�)�6��'3U�;�g��%�������J��+�a5A�&?��Ā� �˞��g%�Ԥ��Q��R�8h��&R	����!	�vV�|(Oȫ�n��.�		��n�c	I�-�n��M$53{&��rؠb�s��$d���-� ��!4I�R�$͇'X��j@nu�R2��!T{Z�}�6�3S����M���O���pYŶ #Q�z��Ҭ���0&���}���\ �I����keYB3P|Bw�ԿS��/�+�r�'�Tۗ�R<n)���H�q56�~,N�R�͆��A"i�S���F"�܄�t��k��E_�JWh��pO u���9�q2��P��WV�))U2d�@U�p�GĜ��Y��g{hZ��j����	��b$$i(=	1������L�A���E�͌v �A�4�K#�b���1v�@pf�ǔ��7ńO�/-#�}���$���7D�:������"�񞪆=��
��0�i��iHc3���m���=��P�9N#l�o�]�q5��l07��.WV,5$k�������Aϊ���d}�i��V&.l8;��do��el�~��C-e�_����"�����<���9��V����\\Wy�h1<KAk�k�Q��}�U<L'n�㼉��;��E^t`CG�	�ΞuٜUiZXQ�C�����>��:|�� �}R��{�>P�]$���Q�K٣����;#��d!��n�T�+�j6h��.�{�.�>�4���j�ؐ (��h���b)m��ެ�B����NTO�e���`S�]��^�`R�����.2�L�`����f�����[۹.(�<�i�"q(�R^��Yx��|zl���]��[q�����Mʁ���MX�W&"�,��yoC�/��.c���sB�N�����B�u�Bf�I���ę�F����ΰ��󲳐�Ҹ����4ΰ6ua�����4���͘����0�:)HN���fBc�M�^N&���UN|���Y)Z$C�hz�4��NT��9�t2��z0�G�Ñ,m-s��gL��ޓ�!G� V0ZY�qf^�A9P���Kժ��;����OXz�BS����D��#�f� �1qxn��YC)9�+D�:-mW���jH��}JJ%;u��|8�i��8�֛���A�]��+g!ne�,��b;�;�u[voJ�R�91���R!�=�U
�C��tf/X�s"��I�H̗(߼a��Cϥ���u�}���l�g��Y�hN����f	_x���uԉ�.��i,�	���~�3�e�p�m�<�6��?%�0�}�)+�T2��7��Z�j5:��NI�ܯrr*��o�C����3.���`$�J?�w`wZ���0�s�]4�Ե�*�,��jl�D��))n״2�f�(��'o��|��0�v<}EF��6~>����~���^f~L���Y9]����)�d_�d�B%-���oz�u�
���>�NI����?Ck:�}�S{j #���{κo�l?v�̓t�s��8<PΔ�
}�{�A+Ϧ�3 I`��>��"�ƽ1�0h�8��p�G���Cc@Kg]���>ZSߜ��<|^�#R�(UӲq�ӛS>��'TZ6�I����9K�I���M#y�ϲ�"�Q��ef"t7�.΢�E�Jg�l 	�T�܇r�«/zU�b?LΖu9� ����'����(:��ÅY�VSTA��=DN0�a(�!�$��<)t�՗|��(�Y��n֎�|�çj��WןH*3���a]�P��Ԑ��p�M"�� q��όt�=yU�T��tَ,���0���<i�e�z҅��@�bc���l�_���$����,�C�
�l��"Te�3btL�6�r���m�\*%�
�c�o�?�]�HȄ$�iq�������Z��T~hS�E���F4$6|5�U��Yg�j�� 0�5l��x�,x��5�JɽR��]�Qɚ��^e�����'��T�OےB,� ȕ<\��jxA�*jrQi�h�?�)�
D�	s\ѧ�y|�<Nl A���q���8��R��&z�s9Mz" �  D�q�8�Xyf��6L�Lwq�Qʻ��k6���U���@�I���KCVcyx	���p��'C� G��/g�S+����iy���⡛���>��>)�R*��w%G���V�(9�}>��+;�'�NN����a[��.�\y��#G�}�f$��C�,�]��ʯ1�PX��I�L0]�l݉��N�f�����weQkP�3wn���OH��@�!���*4y�x �(���I�������F?��-9���&͸#��WPN5���T��k?��n����W�%��?dYLX	�ꡊ1L���>�*������w���y:)�*eǇDvm�9}-��V�h�|6�`-~[�G=�?p�_z�Sb�8Oj����F�6P�&C��;��	���u =��f���x�T+�&���'?�<���3?i������+̆Bl�WiT��%Zf�;���_*U���'ſCP���:ْ$@ ̀�r���5¥,|M�0�N��ٸ�$���#@5s�+X"��Kzÿ�����v���`r�d3��m�B�-�1�|K����WW=ʾ���_f�~�F�Z����b�y��SD�5��3�{����S�׏�P9�]D�EX9E���AZvi/%�X?�YJ��aY���8���ǯ<3�xyf��Xˋ;����W��?|��o��������O?���y����痿~����㏿|���}��W����?�����_�������8��w�߿�'�dB.      3      x������ � �     