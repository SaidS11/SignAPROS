PGDMP         "                |            ModularLocal    13.2    13.2 D    7           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
    public          postgres    false    203   �T       (          0    25228    doctor 
   TABLE DATA           �   COPY public.doctor (usuario, password, email, telefono, fecha_nacimiento, nombre, apellido_paterno, apellido_materno) FROM stdin;
    public          postgres    false    204   �T       )          0    25234    filtros 
   TABLE DATA           ?   COPY public.filtros (nombre, descripcion, valores) FROM stdin;
    public          postgres    false    205   �T       *          0    25240    implementacion 
   TABLE DATA           �   COPY public.implementacion (id, nombre, descripcion, algoritmo_ia, parametros, "precision", desviacion_estandar, entrenado) FROM stdin;
    public          postgres    false    206   
U       ,          0    25248    modelo 
   TABLE DATA           \   COPY public.modelo (id, nombre, algoritmo_ia, protocolo, entrenado, resultados) FROM stdin;
    public          postgres    false    208   'U       .          0    25256 
   multimedia 
   TABLE DATA           \   COPY public.multimedia (nombre, link_video, link_imagen, subido, configuracion) FROM stdin;
    public          postgres    false    210   DU       /          0    25259    paciente 
   TABLE DATA           �   COPY public.paciente (usuario, email, telefono, fecha_nacimiento, nombre, apellido_paterno, apellido_materno, sexo, peso, estatura) FROM stdin;
    public          postgres    false    211   aU       0          0    25262    protocolo_adquisicion 
   TABLE DATA           [   COPY public.protocolo_adquisicion (nombre, doctor, configuracion, descripcion) FROM stdin;
    public          postgres    false    212   ~U       1          0    25265    registro 
   TABLE DATA           \   COPY public.registro (id, datos_crudos, fecha, paciente, protocolo_adquisicion) FROM stdin;
    public          postgres    false    213   �U       3          0    25273     relacion_analisis_implementacion 
   TABLE DATA           X   COPY public.relacion_analisis_implementacion (id, analisis, implementacion) FROM stdin;
    public          postgres    false    215   �U       @           0    0    implementacion_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.implementacion_id_seq', 8, true);
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
       public          postgres    false    212    2963    208            %      x������ � �      &      x������ � �      '      x������ � �      (      x������ � �      )      x������ � �      *      x������ � �      ,      x������ � �      .      x������ � �      /      x������ � �      0      x������ � �      1      x������ � �      3      x������ � �     