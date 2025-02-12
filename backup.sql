PGDMP  8                    }            maquila    17.2    17.2 ~    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    17279    maquila    DATABASE     z   CREATE DATABASE maquila WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE maquila;
                     postgres    false            �            1259    17383 	   empleados    TABLE       CREATE TABLE public.empleados (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    fk_nivel integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.empleados;
       public         heap r       postgres    false            �            1259    17382    empleados_id_seq    SEQUENCE     �   CREATE SEQUENCE public.empleados_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.empleados_id_seq;
       public               postgres    false    227            �           0    0    empleados_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.empleados_id_seq OWNED BY public.empleados.id;
          public               postgres    false    226            �            1259    17335    flujos    TABLE     �   CREATE TABLE public.flujos (
    id integer NOT NULL,
    activo boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.flujos;
       public         heap r       postgres    false            �            1259    17334    flujos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.flujos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.flujos_id_seq;
       public               postgres    false    220            �           0    0    flujos_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.flujos_id_seq OWNED BY public.flujos.id;
          public               postgres    false    219            �            1259    17458 	   licencias    TABLE     "  CREATE TABLE public.licencias (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    fk_maquina character varying(50) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.licencias;
       public         heap r       postgres    false            �            1259    17457    licencias_id_seq    SEQUENCE     �   CREATE SEQUENCE public.licencias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.licencias_id_seq;
       public               postgres    false    235            �           0    0    licencias_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.licencias_id_seq OWNED BY public.licencias.id;
          public               postgres    false    234            �            1259    17369    maquinas    TABLE     #  CREATE TABLE public.maquinas (
    no_serie character varying(50) NOT NULL,
    tipo character varying(100) NOT NULL,
    fk_flujo integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.maquinas;
       public         heap r       postgres    false            �            1259    17323 
   materiales    TABLE     �   CREATE TABLE public.materiales (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.materiales;
       public         heap r       postgres    false            �            1259    17322    materiales_id_seq    SEQUENCE     �   CREATE SEQUENCE public.materiales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.materiales_id_seq;
       public               postgres    false    218            �           0    0    materiales_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.materiales_id_seq OWNED BY public.materiales.id;
          public               postgres    false    217            �            1259    17414    materiales_productos    TABLE     �  CREATE TABLE public.materiales_productos (
    id integer NOT NULL,
    fk_material integer NOT NULL,
    fk_producto integer NOT NULL,
    cantidad integer DEFAULT 1 NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT materiales_productos_cantidad_check CHECK ((cantidad > 0))
);
 (   DROP TABLE public.materiales_productos;
       public         heap r       postgres    false            �            1259    17413    materiales_productos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.materiales_productos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.materiales_productos_id_seq;
       public               postgres    false    231            �           0    0    materiales_productos_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.materiales_productos_id_seq OWNED BY public.materiales_productos.id;
          public               postgres    false    230            �            1259    17398    metas    TABLE     @  CREATE TABLE public.metas (
    id integer NOT NULL,
    unidades integer NOT NULL,
    fk_producto integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT metas_unidades_check CHECK ((unidades > 0))
);
    DROP TABLE public.metas;
       public         heap r       postgres    false            �            1259    17397    metas_id_seq    SEQUENCE     �   CREATE SEQUENCE public.metas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.metas_id_seq;
       public               postgres    false    229            �           0    0    metas_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.metas_id_seq OWNED BY public.metas.id;
          public               postgres    false    228            �            1259    17346    niveles    TABLE       CREATE TABLE public.niveles (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    descripcion character varying(255),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.niveles;
       public         heap r       postgres    false            �            1259    17345    niveles_id_seq    SEQUENCE     �   CREATE SEQUENCE public.niveles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.niveles_id_seq;
       public               postgres    false    222            �           0    0    niveles_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.niveles_id_seq OWNED BY public.niveles.id;
          public               postgres    false    221            �            1259    17492    operadores_licencias    TABLE     :  CREATE TABLE public.operadores_licencias (
    id integer NOT NULL,
    fk_empleado integer NOT NULL,
    fk_licencia integer NOT NULL,
    fecha_expiracion date NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 (   DROP TABLE public.operadores_licencias;
       public         heap r       postgres    false            �            1259    17491    operadores_licencias_id_seq    SEQUENCE     �   CREATE SEQUENCE public.operadores_licencias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.operadores_licencias_id_seq;
       public               postgres    false    239            �           0    0    operadores_licencias_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.operadores_licencias_id_seq OWNED BY public.operadores_licencias.id;
          public               postgres    false    238            �            1259    17475    producciones    TABLE       CREATE TABLE public.producciones (
    id integer NOT NULL,
    cantidad_producto integer NOT NULL,
    fk_flujo integer NOT NULL,
    fecha date NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT producciones_cantidad_producto_check CHECK ((cantidad_producto > 0))
);
     DROP TABLE public.producciones;
       public         heap r       postgres    false            �            1259    17513    producciones_detalles    TABLE     �  CREATE TABLE public.producciones_detalles (
    id integer NOT NULL,
    fk_produccion integer NOT NULL,
    fk_meta integer NOT NULL,
    cumplio boolean DEFAULT false NOT NULL,
    tiempo_muerto integer DEFAULT 0,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT producciones_detalles_tiempo_muerto_check CHECK ((tiempo_muerto >= 0))
);
 )   DROP TABLE public.producciones_detalles;
       public         heap r       postgres    false            �            1259    17512    producciones_detalles_id_seq    SEQUENCE     �   CREATE SEQUENCE public.producciones_detalles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.producciones_detalles_id_seq;
       public               postgres    false    241            �           0    0    producciones_detalles_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.producciones_detalles_id_seq OWNED BY public.producciones_detalles.id;
          public               postgres    false    240            �            1259    17474    producciones_id_seq    SEQUENCE     �   CREATE SEQUENCE public.producciones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.producciones_id_seq;
       public               postgres    false    237            �           0    0    producciones_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.producciones_id_seq OWNED BY public.producciones.id;
          public               postgres    false    236            �            1259    17358 	   productos    TABLE     �   CREATE TABLE public.productos (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.productos;
       public         heap r       postgres    false            �            1259    17437    productos_flujos    TABLE       CREATE TABLE public.productos_flujos (
    id integer NOT NULL,
    fk_producto integer NOT NULL,
    fk_flujo integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 $   DROP TABLE public.productos_flujos;
       public         heap r       postgres    false            �            1259    17436    productos_flujos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.productos_flujos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.productos_flujos_id_seq;
       public               postgres    false    233            �           0    0    productos_flujos_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.productos_flujos_id_seq OWNED BY public.productos_flujos.id;
          public               postgres    false    232            �            1259    17357    productos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.productos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.productos_id_seq;
       public               postgres    false    224            �           0    0    productos_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.productos_id_seq OWNED BY public.productos.id;
          public               postgres    false    223            �           2604    17386    empleados id    DEFAULT     l   ALTER TABLE ONLY public.empleados ALTER COLUMN id SET DEFAULT nextval('public.empleados_id_seq'::regclass);
 ;   ALTER TABLE public.empleados ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    227    226    227            �           2604    17338 	   flujos id    DEFAULT     f   ALTER TABLE ONLY public.flujos ALTER COLUMN id SET DEFAULT nextval('public.flujos_id_seq'::regclass);
 8   ALTER TABLE public.flujos ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    220    219    220            �           2604    17461    licencias id    DEFAULT     l   ALTER TABLE ONLY public.licencias ALTER COLUMN id SET DEFAULT nextval('public.licencias_id_seq'::regclass);
 ;   ALTER TABLE public.licencias ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    235    234    235            �           2604    17326    materiales id    DEFAULT     n   ALTER TABLE ONLY public.materiales ALTER COLUMN id SET DEFAULT nextval('public.materiales_id_seq'::regclass);
 <   ALTER TABLE public.materiales ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    217    218    218            �           2604    17417    materiales_productos id    DEFAULT     �   ALTER TABLE ONLY public.materiales_productos ALTER COLUMN id SET DEFAULT nextval('public.materiales_productos_id_seq'::regclass);
 F   ALTER TABLE public.materiales_productos ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    230    231    231            �           2604    17401    metas id    DEFAULT     d   ALTER TABLE ONLY public.metas ALTER COLUMN id SET DEFAULT nextval('public.metas_id_seq'::regclass);
 7   ALTER TABLE public.metas ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    228    229    229            �           2604    17349 
   niveles id    DEFAULT     h   ALTER TABLE ONLY public.niveles ALTER COLUMN id SET DEFAULT nextval('public.niveles_id_seq'::regclass);
 9   ALTER TABLE public.niveles ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    221    222    222            �           2604    17495    operadores_licencias id    DEFAULT     �   ALTER TABLE ONLY public.operadores_licencias ALTER COLUMN id SET DEFAULT nextval('public.operadores_licencias_id_seq'::regclass);
 F   ALTER TABLE public.operadores_licencias ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    238    239    239            �           2604    17478    producciones id    DEFAULT     r   ALTER TABLE ONLY public.producciones ALTER COLUMN id SET DEFAULT nextval('public.producciones_id_seq'::regclass);
 >   ALTER TABLE public.producciones ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    237    236    237            �           2604    17516    producciones_detalles id    DEFAULT     �   ALTER TABLE ONLY public.producciones_detalles ALTER COLUMN id SET DEFAULT nextval('public.producciones_detalles_id_seq'::regclass);
 G   ALTER TABLE public.producciones_detalles ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    240    241    241            �           2604    17361    productos id    DEFAULT     l   ALTER TABLE ONLY public.productos ALTER COLUMN id SET DEFAULT nextval('public.productos_id_seq'::regclass);
 ;   ALTER TABLE public.productos ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    224    223    224            �           2604    17440    productos_flujos id    DEFAULT     z   ALTER TABLE ONLY public.productos_flujos ALTER COLUMN id SET DEFAULT nextval('public.productos_flujos_id_seq'::regclass);
 B   ALTER TABLE public.productos_flujos ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    233    232    233            �          0    17383 	   empleados 
   TABLE DATA           Q   COPY public.empleados (id, nombre, fk_nivel, created_at, updated_at) FROM stdin;
    public               postgres    false    227   6�       �          0    17335    flujos 
   TABLE DATA           D   COPY public.flujos (id, activo, created_at, updated_at) FROM stdin;
    public               postgres    false    220   �       �          0    17458 	   licencias 
   TABLE DATA           S   COPY public.licencias (id, nombre, fk_maquina, created_at, updated_at) FROM stdin;
    public               postgres    false    235   þ       �          0    17369    maquinas 
   TABLE DATA           T   COPY public.maquinas (no_serie, tipo, fk_flujo, created_at, updated_at) FROM stdin;
    public               postgres    false    225   m�       �          0    17323 
   materiales 
   TABLE DATA           H   COPY public.materiales (id, nombre, created_at, updated_at) FROM stdin;
    public               postgres    false    218   M�       �          0    17414    materiales_productos 
   TABLE DATA           n   COPY public.materiales_productos (id, fk_material, fk_producto, cantidad, created_at, updated_at) FROM stdin;
    public               postgres    false    231   0      �          0    17398    metas 
   TABLE DATA           R   COPY public.metas (id, unidades, fk_producto, created_at, updated_at) FROM stdin;
    public               postgres    false    229   �,      �          0    17346    niveles 
   TABLE DATA           R   COPY public.niveles (id, nombre, descripcion, created_at, updated_at) FROM stdin;
    public               postgres    false    222   SQ      �          0    17492    operadores_licencias 
   TABLE DATA           v   COPY public.operadores_licencias (id, fk_empleado, fk_licencia, fecha_expiracion, created_at, updated_at) FROM stdin;
    public               postgres    false    239   �R      �          0    17475    producciones 
   TABLE DATA           f   COPY public.producciones (id, cantidad_producto, fk_flujo, fecha, created_at, updated_at) FROM stdin;
    public               postgres    false    237   �}      �          0    17513    producciones_detalles 
   TABLE DATA           {   COPY public.producciones_detalles (id, fk_produccion, fk_meta, cumplio, tiempo_muerto, created_at, updated_at) FROM stdin;
    public               postgres    false    241   L�      �          0    17358 	   productos 
   TABLE DATA           G   COPY public.productos (id, nombre, created_at, updated_at) FROM stdin;
    public               postgres    false    224   $�      �          0    17437    productos_flujos 
   TABLE DATA           ]   COPY public.productos_flujos (id, fk_producto, fk_flujo, created_at, updated_at) FROM stdin;
    public               postgres    false    233   ��      �           0    0    empleados_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.empleados_id_seq', 1, false);
          public               postgres    false    226            �           0    0    flujos_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.flujos_id_seq', 1, false);
          public               postgres    false    219            �           0    0    licencias_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.licencias_id_seq', 1, false);
          public               postgres    false    234            �           0    0    materiales_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.materiales_id_seq', 1, false);
          public               postgres    false    217            �           0    0    materiales_productos_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.materiales_productos_id_seq', 1, false);
          public               postgres    false    230            �           0    0    metas_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.metas_id_seq', 1, false);
          public               postgres    false    228            �           0    0    niveles_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.niveles_id_seq', 1, false);
          public               postgres    false    221            �           0    0    operadores_licencias_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.operadores_licencias_id_seq', 1, false);
          public               postgres    false    238            �           0    0    producciones_detalles_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.producciones_detalles_id_seq', 1, false);
          public               postgres    false    240            �           0    0    producciones_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.producciones_id_seq', 1, false);
          public               postgres    false    236            �           0    0    productos_flujos_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.productos_flujos_id_seq', 1, false);
          public               postgres    false    232            �           0    0    productos_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.productos_id_seq', 1, false);
          public               postgres    false    223            �           2606    17390    empleados empleados_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.empleados
    ADD CONSTRAINT empleados_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.empleados DROP CONSTRAINT empleados_pkey;
       public                 postgres    false    227            �           2606    17343    flujos flujos_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.flujos
    ADD CONSTRAINT flujos_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.flujos DROP CONSTRAINT flujos_pkey;
       public                 postgres    false    220            �           2606    17467    licencias licencias_nombre_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.licencias
    ADD CONSTRAINT licencias_nombre_key UNIQUE (nombre);
 H   ALTER TABLE ONLY public.licencias DROP CONSTRAINT licencias_nombre_key;
       public                 postgres    false    235            �           2606    17465    licencias licencias_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.licencias
    ADD CONSTRAINT licencias_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.licencias DROP CONSTRAINT licencias_pkey;
       public                 postgres    false    235            �           2606    17375    maquinas maquinas_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.maquinas
    ADD CONSTRAINT maquinas_pkey PRIMARY KEY (no_serie);
 @   ALTER TABLE ONLY public.maquinas DROP CONSTRAINT maquinas_pkey;
       public                 postgres    false    225            �           2606    17332     materiales materiales_nombre_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.materiales
    ADD CONSTRAINT materiales_nombre_key UNIQUE (nombre);
 J   ALTER TABLE ONLY public.materiales DROP CONSTRAINT materiales_nombre_key;
       public                 postgres    false    218            �           2606    17330    materiales materiales_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.materiales
    ADD CONSTRAINT materiales_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.materiales DROP CONSTRAINT materiales_pkey;
       public                 postgres    false    218            �           2606    17423 .   materiales_productos materiales_productos_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.materiales_productos
    ADD CONSTRAINT materiales_productos_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.materiales_productos DROP CONSTRAINT materiales_productos_pkey;
       public                 postgres    false    231            �           2606    17406    metas metas_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.metas
    ADD CONSTRAINT metas_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.metas DROP CONSTRAINT metas_pkey;
       public                 postgres    false    229            �           2606    17355    niveles niveles_nombre_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.niveles
    ADD CONSTRAINT niveles_nombre_key UNIQUE (nombre);
 D   ALTER TABLE ONLY public.niveles DROP CONSTRAINT niveles_nombre_key;
       public                 postgres    false    222            �           2606    17353    niveles niveles_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.niveles
    ADD CONSTRAINT niveles_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.niveles DROP CONSTRAINT niveles_pkey;
       public                 postgres    false    222            �           2606    17499 .   operadores_licencias operadores_licencias_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.operadores_licencias
    ADD CONSTRAINT operadores_licencias_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.operadores_licencias DROP CONSTRAINT operadores_licencias_pkey;
       public                 postgres    false    239            �           2606    17523 0   producciones_detalles producciones_detalles_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.producciones_detalles
    ADD CONSTRAINT producciones_detalles_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.producciones_detalles DROP CONSTRAINT producciones_detalles_pkey;
       public                 postgres    false    241            �           2606    17483    producciones producciones_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.producciones
    ADD CONSTRAINT producciones_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.producciones DROP CONSTRAINT producciones_pkey;
       public                 postgres    false    237            �           2606    17444 &   productos_flujos productos_flujos_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.productos_flujos
    ADD CONSTRAINT productos_flujos_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.productos_flujos DROP CONSTRAINT productos_flujos_pkey;
       public                 postgres    false    233            �           2606    17367    productos productos_nombre_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_nombre_key UNIQUE (nombre);
 H   ALTER TABLE ONLY public.productos DROP CONSTRAINT productos_nombre_key;
       public                 postgres    false    224            �           2606    17365    productos productos_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.productos DROP CONSTRAINT productos_pkey;
       public                 postgres    false    224            �           1259    17396    idx_empleados_nombre    INDEX     L   CREATE INDEX idx_empleados_nombre ON public.empleados USING btree (nombre);
 (   DROP INDEX public.idx_empleados_nombre;
       public                 postgres    false    227            �           1259    17344    idx_flujos_activo    INDEX     F   CREATE INDEX idx_flujos_activo ON public.flujos USING btree (activo);
 %   DROP INDEX public.idx_flujos_activo;
       public                 postgres    false    220            �           1259    17473    idx_licencias_nombre    INDEX     L   CREATE INDEX idx_licencias_nombre ON public.licencias USING btree (nombre);
 (   DROP INDEX public.idx_licencias_nombre;
       public                 postgres    false    235            �           1259    17381    idx_maquinas_tipo    INDEX     F   CREATE INDEX idx_maquinas_tipo ON public.maquinas USING btree (tipo);
 %   DROP INDEX public.idx_maquinas_tipo;
       public                 postgres    false    225            �           1259    17333    idx_materiales_nombre    INDEX     N   CREATE INDEX idx_materiales_nombre ON public.materiales USING btree (nombre);
 )   DROP INDEX public.idx_materiales_nombre;
       public                 postgres    false    218            �           1259    17434 !   idx_materiales_productos_material    INDEX     i   CREATE INDEX idx_materiales_productos_material ON public.materiales_productos USING btree (fk_material);
 5   DROP INDEX public.idx_materiales_productos_material;
       public                 postgres    false    231            �           1259    17435 !   idx_materiales_productos_producto    INDEX     i   CREATE INDEX idx_materiales_productos_producto ON public.materiales_productos USING btree (fk_producto);
 5   DROP INDEX public.idx_materiales_productos_producto;
       public                 postgres    false    231            �           1259    17412    idx_metas_producto    INDEX     K   CREATE INDEX idx_metas_producto ON public.metas USING btree (fk_producto);
 &   DROP INDEX public.idx_metas_producto;
       public                 postgres    false    229            �           1259    17356    idx_niveles_nombre    INDEX     H   CREATE INDEX idx_niveles_nombre ON public.niveles USING btree (nombre);
 &   DROP INDEX public.idx_niveles_nombre;
       public                 postgres    false    222            �           1259    17510 !   idx_operadores_licencias_empleado    INDEX     i   CREATE INDEX idx_operadores_licencias_empleado ON public.operadores_licencias USING btree (fk_empleado);
 5   DROP INDEX public.idx_operadores_licencias_empleado;
       public                 postgres    false    239            �           1259    17511 !   idx_operadores_licencias_licencia    INDEX     i   CREATE INDEX idx_operadores_licencias_licencia ON public.operadores_licencias USING btree (fk_licencia);
 5   DROP INDEX public.idx_operadores_licencias_licencia;
       public                 postgres    false    239            �           1259    17535    idx_producciones_detalles_meta    INDEX     c   CREATE INDEX idx_producciones_detalles_meta ON public.producciones_detalles USING btree (fk_meta);
 2   DROP INDEX public.idx_producciones_detalles_meta;
       public                 postgres    false    241            �           1259    17534 $   idx_producciones_detalles_produccion    INDEX     o   CREATE INDEX idx_producciones_detalles_produccion ON public.producciones_detalles USING btree (fk_produccion);
 8   DROP INDEX public.idx_producciones_detalles_produccion;
       public                 postgres    false    241            �           1259    17490    idx_producciones_fecha    INDEX     P   CREATE INDEX idx_producciones_fecha ON public.producciones USING btree (fecha);
 *   DROP INDEX public.idx_producciones_fecha;
       public                 postgres    false    237            �           1259    17489    idx_producciones_flujo    INDEX     S   CREATE INDEX idx_producciones_flujo ON public.producciones USING btree (fk_flujo);
 *   DROP INDEX public.idx_producciones_flujo;
       public                 postgres    false    237            �           1259    17456    idx_productos_flujos_flujo    INDEX     [   CREATE INDEX idx_productos_flujos_flujo ON public.productos_flujos USING btree (fk_flujo);
 .   DROP INDEX public.idx_productos_flujos_flujo;
       public                 postgres    false    233            �           1259    17455    idx_productos_flujos_producto    INDEX     a   CREATE INDEX idx_productos_flujos_producto ON public.productos_flujos USING btree (fk_producto);
 1   DROP INDEX public.idx_productos_flujos_producto;
       public                 postgres    false    233            �           1259    17368    idx_productos_nombre    INDEX     L   CREATE INDEX idx_productos_nombre ON public.productos USING btree (nombre);
 (   DROP INDEX public.idx_productos_nombre;
       public                 postgres    false    224            �           2606    17391    empleados fk_empleado_nivel    FK CONSTRAINT     }   ALTER TABLE ONLY public.empleados
    ADD CONSTRAINT fk_empleado_nivel FOREIGN KEY (fk_nivel) REFERENCES public.niveles(id);
 E   ALTER TABLE ONLY public.empleados DROP CONSTRAINT fk_empleado_nivel;
       public               postgres    false    4812    222    227            �           2606    17468    licencias fk_licencia_maquina    FK CONSTRAINT     �   ALTER TABLE ONLY public.licencias
    ADD CONSTRAINT fk_licencia_maquina FOREIGN KEY (fk_maquina) REFERENCES public.maquinas(no_serie);
 G   ALTER TABLE ONLY public.licencias DROP CONSTRAINT fk_licencia_maquina;
       public               postgres    false    225    4820    235            �           2606    17376    maquinas fk_maquina_flujo    FK CONSTRAINT     z   ALTER TABLE ONLY public.maquinas
    ADD CONSTRAINT fk_maquina_flujo FOREIGN KEY (fk_flujo) REFERENCES public.flujos(id);
 C   ALTER TABLE ONLY public.maquinas DROP CONSTRAINT fk_maquina_flujo;
       public               postgres    false    4806    220    225            �           2606    17424 2   materiales_productos fk_material_producto_material    FK CONSTRAINT     �   ALTER TABLE ONLY public.materiales_productos
    ADD CONSTRAINT fk_material_producto_material FOREIGN KEY (fk_material) REFERENCES public.materiales(id);
 \   ALTER TABLE ONLY public.materiales_productos DROP CONSTRAINT fk_material_producto_material;
       public               postgres    false    4804    218    231            �           2606    17429 2   materiales_productos fk_material_producto_producto    FK CONSTRAINT     �   ALTER TABLE ONLY public.materiales_productos
    ADD CONSTRAINT fk_material_producto_producto FOREIGN KEY (fk_producto) REFERENCES public.productos(id);
 \   ALTER TABLE ONLY public.materiales_productos DROP CONSTRAINT fk_material_producto_producto;
       public               postgres    false    231    224    4817            �           2606    17407    metas fk_meta_producto    FK CONSTRAINT     }   ALTER TABLE ONLY public.metas
    ADD CONSTRAINT fk_meta_producto FOREIGN KEY (fk_producto) REFERENCES public.productos(id);
 @   ALTER TABLE ONLY public.metas DROP CONSTRAINT fk_meta_producto;
       public               postgres    false    224    4817    229            �           2606    17500 2   operadores_licencias fk_operador_licencia_empleado    FK CONSTRAINT     �   ALTER TABLE ONLY public.operadores_licencias
    ADD CONSTRAINT fk_operador_licencia_empleado FOREIGN KEY (fk_empleado) REFERENCES public.empleados(id);
 \   ALTER TABLE ONLY public.operadores_licencias DROP CONSTRAINT fk_operador_licencia_empleado;
       public               postgres    false    239    4822    227            �           2606    17505 2   operadores_licencias fk_operador_licencia_licencia    FK CONSTRAINT     �   ALTER TABLE ONLY public.operadores_licencias
    ADD CONSTRAINT fk_operador_licencia_licencia FOREIGN KEY (fk_licencia) REFERENCES public.licencias(id);
 \   ALTER TABLE ONLY public.operadores_licencias DROP CONSTRAINT fk_operador_licencia_licencia;
       public               postgres    false    4839    239    235            �           2606    17529 0   producciones_detalles fk_produccion_detalle_meta    FK CONSTRAINT     �   ALTER TABLE ONLY public.producciones_detalles
    ADD CONSTRAINT fk_produccion_detalle_meta FOREIGN KEY (fk_meta) REFERENCES public.metas(id);
 Z   ALTER TABLE ONLY public.producciones_detalles DROP CONSTRAINT fk_produccion_detalle_meta;
       public               postgres    false    241    229    4826                        2606    17524 6   producciones_detalles fk_produccion_detalle_produccion    FK CONSTRAINT     �   ALTER TABLE ONLY public.producciones_detalles
    ADD CONSTRAINT fk_produccion_detalle_produccion FOREIGN KEY (fk_produccion) REFERENCES public.producciones(id);
 `   ALTER TABLE ONLY public.producciones_detalles DROP CONSTRAINT fk_produccion_detalle_produccion;
       public               postgres    false    237    241    4843            �           2606    17484     producciones fk_produccion_flujo    FK CONSTRAINT     �   ALTER TABLE ONLY public.producciones
    ADD CONSTRAINT fk_produccion_flujo FOREIGN KEY (fk_flujo) REFERENCES public.flujos(id);
 J   ALTER TABLE ONLY public.producciones DROP CONSTRAINT fk_produccion_flujo;
       public               postgres    false    220    4806    237            �           2606    17450 (   productos_flujos fk_producto_flujo_flujo    FK CONSTRAINT     �   ALTER TABLE ONLY public.productos_flujos
    ADD CONSTRAINT fk_producto_flujo_flujo FOREIGN KEY (fk_flujo) REFERENCES public.flujos(id);
 R   ALTER TABLE ONLY public.productos_flujos DROP CONSTRAINT fk_producto_flujo_flujo;
       public               postgres    false    4806    233    220            �           2606    17445 +   productos_flujos fk_producto_flujo_producto    FK CONSTRAINT     �   ALTER TABLE ONLY public.productos_flujos
    ADD CONSTRAINT fk_producto_flujo_producto FOREIGN KEY (fk_producto) REFERENCES public.productos(id);
 U   ALTER TABLE ONLY public.productos_flujos DROP CONSTRAINT fk_producto_flujo_producto;
       public               postgres    false    224    233    4817            �      x���M�,;�]�猢&p���2�}�Q@U�{��3S��>�u������Z���������������.���S���\���v]�������?�9�﷠i��߿z�A����oE��#�������?�9M��韦�Ϯ�5����i�Ѵ����u6-�4h:~d|���)/w�"����~Ʒ��	׋��F��G귗�_��/���O�M��TO���Ou��i;�<�!�gߎ�l[A[��l�s7{�]��b���j����g���)�4���?{��g/�~��o'�?�r=5�Z+
5���ӎz�CM%��E��ώ?��.5���_���x��OMU�?;ךּ���^ʯ�S�.�^��������xj*1���9���OM��n���޾��j4��h��+p�T��gͿBE�ʘ��TS��Ά����z��SS�-�1�3Fѷ��Q��TS���%xj>p;��SS���y�7m?3�,5�t�zKK�϶�7��SS��(��ͣ���T�%p��g�3}\ᨺ��C��.;��V8��a��IO/��l���*ǋ~��>6���PS}|���R��o;��V8j���<���R�\a��>#�{���;�m�;Pᨩ�ݾ�x.�)�6����-�^���1Uj���w�������k
�'��h���PM��\�x6�#c��Z�������d5U;s��7}x�0�Tk�׿��>n0�T����5f� ��਩>�[y���n���@�����{��ޅ1��QS�K.~|�O��^����aX6H=�:<տ�z��旟C:<5U߳�������OM%�Y���<x:,5�����b���OMU�<]z�hmdKM5�7{����˼{������P	/Pe[8j*i�۲{ʎo�����o���{]�ۅ���L��0:)�7h�RS��6C��`�SS�
L��3ƙ�0�T��T���	�k���җ7��@5`���J��ˠs�TS��0��5�Ma���3<��;�	��Jΐ���Y�*��Tf1^Bdct��0�T/>#��^��TkUP|�O�in�KM����M'��+cXj�����5h>{�SS-_����K�B��'<�����OM���_l������^k����lU`�L5�0.�J��I�%�TS�K�S����/xj����_u<�����j{h�XIp�7,5������R��7,5��d��0����>���1;�>�a��������ZѾ@7uc��s7�ް�TR��Ant�a�{�}���8��L�q�R��R-�?����jq�"�ݚ�⁥��/P��hꁧ�ZMk���������/#@��QO��Ȥz0��\1,5��o�[�Lx��;���Rf��R��k�l*x�ᨩ�ĝqL��8j���Y�����K=�fŇ�۰��\�S���8R�����V�V�<"~�)���Uи��/��_n�UѸ~'N�=ɩD���mS���gS����m?�����	r4�[jt :�O�^h����[Z��u���	������/׃��1u ����X>��j�sO�\fc�Kd����4(��0]Պ��5'з8]d�Z�_	W�`C��Uɶ�dkO\5�5՚�#�F@�U��0�;� " uUr�I	�G�� ��J���E�S���Z�������+�����������d��\
��t���=��q��kpuU�A�8����������
'r[Wu�ۋ���b`�V���$��P@�U�c�����ᮩ�䊏\���^W�/)q��b`W��	����)�]��Hd?{ukƮjM�a��oP̶pW�g��O�c}̮J�+!����]�^�V����a/%�_@��w Λ@���霰��]g�_�>$��1~�Ϧ�ٻL �+ �v<P�n1�ffcl*�3�;�[�-���"1�^�U<��jlIhK�.��ʱC{��/��d/�}P�������-cpwU;�)>�ln���a�v�`b�	�r�&л��F}<ɖ0~���a�5�).�0໪�R�8��p6��������N^5�տ�Ο12��F{���;��2%��ń���r�b �U�[)|��
�j�+P��7�^��W���о�����7d�\��0kꘋ���8�ꐰe�? �U<v���Fū:�j
��C��U�݃I��� �U��-��V3��w����D�k�����7���
<^��}�<�
@^��㤰Ꜣ@�ey��#+	H^����+Y�3�L��U��),f>��5���=E5�+��򪤜EE@ƕ������}�A��2�j��w��ýp�W%�_��	�h^�s�.I����U�A�%!n�
8�jm'��M�6�^S��P2'�Š-�u�����@�@j6�����6���]=��\
�۾�,� �N zU'֌�j�c�W��þi��[��U���0�_��ζ��}����}Fa�1�5��W��9F�ڎ?����s
�usY��-���Yf������ ����Bl�^'�zU���ZD�~� ի2�S��}tV/������&U�zUk�5�X}h8z޲�>K4@��Um6P�$���e��+�a�[�[��U��H̨Ⴓ ث*f6	�<�y� ��V*)�3vpm�`��,����6�=P"f�}�im�+����*!�|�
^�jeڇT��B�W�V"���M���F�{o�7�)!g�^��ޕ�ێ�We��C�1�=gcxk*�e���o���mK�Y��y�����T�5a�u����\���lk�
�|�֎��᭩^�
�sҮ���^՞�Zb��~�RX���#{3��^�	��
�j�W��|ݯS?�4�3�WufTIR8�6�ի2�nْ�X�*�c�T�P����\�m̟�W5�+����`��ήH\��"
@����$��0�5U���i�S�zU;	$ۯc�U �U���<�������,>)���a:-�N��U�A>Khw0���'����k�m�zR#�a�wX���^ՊMk��-t4}ٌ��8c�0&0zUfr�;؅Q��������c�W��ĸD���0zU+�|Eˁ���Z1 $fQv�<@����Q8��k�0����	qv������B<^@�U����Ӂ߮��f�_��?�6�]�^��q:�{����Z�{';)�� �U���|��.������6��$, ����l��U�\�
:����w�^���zn��W��X]����R@�6��y��6�]S�c�d��p�0W��5��,�<�jONW�����ϫ�{ߗ�������bڪ�p�Z��%ǘ�wa��V���Ⳝ
�*1B��S�׶B�#j�<�J�|p�9�m��yUR���� ��d?�p����0�0g0$y#x|� ϫ�r8����z�C���]���z�m������t^��<�$^�s�Wuz+=ٍނ�^��:�}�@��p�N�/	�h���lw)�?K�$O�?s�V��S����[��^{g1�	�t����τ��\ZD�W��E����vj�W��L�]"��We�z��v
�*����X�Ϋ��
�$q��輪����4�����:�$�<�ނΫ:�";!�.���~La��L�W�ƀ���\��lsM��N�Ӣ�`f'	�yUOY..=m6���z����x�A�U�Ϋ�mz��o�L�� ��8�� а��3�l^�.-y�I�l^�Z,J�����+�*9QDt5kxT�yU���nN�m��u'|�7�h|V��a�D��ͫ�ULV�vS��Uz���D�yU��6 ��
`��D��^9�h|�tO2���輪��/a�gm�
:��n�%�{,� sɚkz������<�����	�yU{V�;Q}bg��'�>��GB[�K�=K�@*_F�yU�0i�	�T�WuR���s��
<�j�n��.|gc�k��V���%�=�R�U�ZYX΅H�W��K���� ����F񲹟QA�U����eث�ZZz�I6����/-T��B�m�Ϧ���W1e B�Yfc�k���IΧ��^������+'�K���2`    �^��Rӝ�2��a�*?���=�ە���j����CTpzU��Av��^���0d�8pԫ�̇�!��a/ͦ��Ø��p�ԫ:e��#v�b�W�2��B�[��U��2^Ir�� �׍�}��	&�#��+�^\�l{��D�WU�p�N�1�5�6fH�	�ԫ23E\�;��ԫ��D�����j�*R̯'�+H��=G<�gc�ː�����Ͷ��.c�\ ����Wu��-$n�ԫڃf��N�SA�U��\_��^�z�©��z���zۑjH	�+@���vt�\���םH��U�PWpzU;�M��ɩ ����<�c��F;v�ԫ*��i��}� �u�l�0�U�I<�]����M�O�р��N�/���ƵV���wGª�s��W�8Ip���zU����s�
X����0���_�͜�ZYg�իڅbF�2�����p��&$.�`��ƹ�pr��T�j�&����^�1I�����^�k����[�A��UmS�E���2����Xǥ�T�zU����>>�zU�Q8<P]^�lw��s�=<���V�UY��(S�*h��s(&�~W���֫2�ڒb��.��z�Sf!��Þ��֫25!�A��Ͷp�}����7�]J�O�OL,wo#h��E4B��rf[��~��)�>Օi�ma����MJ�`X��֫ZQHȮ�[Z��^��m!�q���^Ն��l���:�]���y���ޭF��U�l6FhY�;�^O�	�w���l\���;�9�*p����RR�+�5�]��g�>��u5x������d�w����6x��R��~x�*[�0��<�����./II�pp�ثZ?��?�LkE�zƟP�"T7j ��d�p�	����MÁ��3���*3\�E�myY{Ug�
��.zh ��N�c,�t��~����aI ~뽁׫Z��BI��Rp���!���7�zU�i`t���&�T���#�9g[XK�M��n�V��W����d����R򒎘.밁�71{A%Yo>��a-�͞��S�W%f��E{����U�����8��ի��jD3�k`���'b1Ew�@�����o��9�^����P��Um@������(R�����!Hq]w��������Dn ��ֹ���?�}���U��)�ko�^�Y�g����UɁ�a+��}5pzU���r7`��j��(�\4��[������X�ӫ��[�4�g�r�k%ԋ�������^�٢A9?31�\���l�Ѷ�.���d���W���ԫZ�m N͟�o�����N��P��a�Vl̰�n��U���h�]�5pzU弋�,�#]�^�!�a����gc�����IFWʼӫ�mRkǂ�J���I1XVno����?⾄��U���$��#�W%�	�D�ƹ	��-F_���^L�UW�Wu���.X����U��4�!�2�^�ڌ�ۋ�Wbj���N>|8䶭};��q{�x�ـ�U� "<c3��X�9�0������Z7-�C	|�Ы�����Yd�We�g����z��z�3{���Z��4�+Y��x�W��2��
1𼪕-�c�+�ڀ��x��T����ָ�ɔ+��[��xiz� ��Bh��m���<��q��W%�h��ϫ:��t���L��N�,��j�yUm�(�t.��6,
�h}P1�\�J�b��Ե�� �|�%諛������<����'�bj�yU?��y�mc�yUkN�	��t^�:�����A�U�A��2�*S�+;�l�	:�j�Ć8��=�]w?Ɋ� ��T���{����YQx�0̵
�d_|�¬:��󵨐^P;�WUΐO�T�.��V�oV@�-��U�Cۮ�]�o�΍���ā%9ؼ�3�ǁ�\�ͫڹ`ɡ\Wb��ͫ�#WV��>'�yU}{!�ބ��L.}�d�9ؼ*�u���&�yU��4���t�yUb`@xƬ�Ё�U�}�%̨��� ��:g�C��P'��̫:�'����"��*SY>+|i��2������ ��j��i�}��ˬ@�'�m;�|�̶ϓ�F���]��za�I�Wu���A��'0�ʞ1MjO��UYbyŜ�A�U���+ t�yU;�-�ʫ>}�ͫڍK���\�We�&�����%&�1���;�|_h>;M�|�~�WeXs�`Dށ��N����^�"@�W��~�	'c;ȼ�](|t5,:м����JК�ưWi��^���`��Ԥ_�+��lw��y@8�����4�jD8���M���U��������j1+��Ot�o:%��B�[�Wu������/�yU�������v�ɰ��;�1�U��ZbZ�� #༪��[�i�W�� �����\�b���z��F��������Oܱfx���U�l�p'��8��|�*�Z�'�yU��'�;�.r�WU����h8�w��<��2fc��u���WC輪�vH�����^S��J�57�:�*S�:�ynv�yU�������Ϋ�������<�j�f�$!�������P%Ca�~>�Ε_��ϫ*�mF<����U�Y�d�Bz�yU�1%��@��U�<�P|���|��Z7%)����֞�D4����k�뤮e�{sc��*f���W��E��'�: }��I�i����c�#�՟�;������ ?G��w[�&T�_��Ы*gI�̊X����>_�p��D��0���ſ}1������Y��<�<�j�Y�r�rv�yU{�ָ�;o?�ZZ�Ƭ��"�[�|��R7���ŀ>�J�y�@�H�:���E�W!|���z�6!�9����fwX���t^�9?��������w�;�*9#@,]˃Rt^�����v7�|_�nZ~�d��Ϋ2�X�0�U��s�V�"�ͫZ����"ŵ��V�|q;�>(�����G��?���U���ȹ�-�8��TPIP�Z�yU���1`r�%ؼ�S4;n����|ߟ��h6���v>?�d%p(��᭧��T���P�W�/!'����p����l�
�p��B7=�˫����~�9D�o� �We�`�TU����U���Q�8�ʦ%$glw�yU'�(V��1@�U��#L���gێ��d���_��� ���MI��y�<�j'��=�O��t��}����w�l����~F|P�� �*���y���^��D�������Sf+v6]�^���h,�r�����sRRb��� zU��r�@[V�^���ќ� ��̪<YX<d�K�f�����4�^b�c28�� �������W �X�>��!� �c4�%�;C�8 �U���0�8� �W%���*����c�����h�v� ��g�B�� �Weˮ$'``j�yU;U'�������wǡ�ո��V]��%R�������Y�>���N��>�^��nb��� ����_���پ�W�ː���s������\� �P zUr>��|,D= �U��~�������R�i־�. zU��dD�E ��ھ�xr���|~4���}��y��U[U5P��W|^���Y������[>�P |^�]"��(����^?g#%�6&��j��|�����{��|�<�ic��B�J�N�����}Kh�)�D�����zUg����hث�L�W��b��B��|w(;���^�)@k��� �W%�`X�R4����ejB��B��~�!|��:��5n��D8�[�FmI,���^���RXK0�q Ы���:�� �WU�[���K �cW���\̕�1�56��G��� �We*')7�A�U��:3��B���Ƴj�i��j ��?�+ _�| Џ���,��g�Dm�W�B�� �W�����˅�-�5��[2Һ�|^��\	+�g����*Se8���;}�ʿ���@��|H��t�� zUfb�U�X.|�Ы��3c��[�я��ؒ|s^�q�B?V)��gS��]x�;c&|�ҧ�ζ��m(j� �   gh�X߉�d��f[x�'0i�՗]@���C"��t@���w�Ü莴 zUb�0��˧�^�ٶ��S~����I,���F�����>�Ƌ���js@���~�z𡃘N�3�~<��`�i�2��]ϰ�,K	�U�]��|&;��p�s�	&�����ص賴��/A^`����cc�-��������{T�;      �   �   x�m��!C�PE��c~��%�T��lP$N�c[��TQ���������Y
�������˕��h5�k�ba�4�dS��l�T¼���[=7ߖװ�g�˶C���=:˭��,����k�?��tSt��L�v�?����P�      �      x�������n�뻞"/���d;]��H .R�����D�#5� �8g0���/��GR��߿���������㐿��������������?ǿ��������0�2Y��0�����a�`��Op��/?J��֧z5h_�����>��0�a������Jz��ty��k��?���c1p���5 ��ƟC�Wx�@b\^\_���,cp���5p�����@~���]^A�����gx��3b���"��,L-�|����g�bb��ߚ�z��WY���Q���}�+[8~�f� 9��q|��^��+]?�K�G�zsԞ�����eN
)S�}�o/��f��(R�"��k�X���͞�\%��LI^�Y� ФLM������{�.�ThR�&M|Z���a� M��d����Q�ﳎ�B�:5ن/O�y��A�I������f$�U�/�&uj��x����Ф�&Ϗ�ߊ�X�c� M�������=[�l}hR�&��bdM�^
M�kr��mv;�[@�:59�����tԯ�n6M�Ԥ��5�������~���w�݃�I��������l��ˠI��l�w���;�A�暜+mϳ�g�\g�A��u���H�N��ڠI��������ޠI�������<��^M��d���U�3�0Mڍ=�g�L�\�٫A���oq�ݿ��}5h��:y�LN+��ج3�A�M�jI_.�b�C�&�����f}�u�i�d��<���:�:fV�&����s}�o�W��M���{��{�w�U#�M�3���?�</d]�^�l�N6�e�5��5h�MM�;������&���s�+��$��ա��g��(�s�G����d����:�ɞ�&�+�Mv?��8��Bv��kvh�OM��ꑲo*���S��;�指oM��C��&Mr���dwM^�-�פ����d���>tYa:4١����q?���0��q`f��0�Un�q49|��O�����P�Q��y��޳m��&���=~[��hrLM�\'[^i?�E��S���g��+LǾ9��1����(���M��I�;������g�hr\�qt9��׀&�ԤLϼ���SҢ��<�&�8��U}�#=��S������[�;{��������B{�����i�ݟ��&���yOh�l-���"Y'4yv��g�-��S�	M�~ƙ���W|�e^���95��o���U�&���'�r䙥T4yޘ��3�&���M^�N��A6z`8�&��ɣ��i��ҙ��&/jR6���P��&/߻�~�{�)oq�c����83�`�ئr����8SQc]�v_�uA��Ԥ�ߦ������55�ģ�r��_}A����>L�/N��4yMM�8��ƏZ��74yOM�TԵ9���yoh�����u�X�nh�V�nK~��B����&���3vٻyb���{j�k(��y��nh�vM.��2��M�<���.Z|������&o�q�у��M�S�*��0��nh�&�s�5c���(���n��z˜e����{ȡ0�X��$ ?jLL���]����ָ��`b
S"�[]��A���T�]��u߹�Z�1`bJs�?t���\���	�/be�T��r\0���'Q+áO�&ܳ��3�1�G:.p���	�ә�=Om�1��� �C���V�"��&�Π:�z���	��H	��[u���:���#��X��`G촹����#�c�z��l�^(Ў8�q]hV��Û�툳�H��x:��8ܙ��}!�9�#Nw��)>"�u�#�w�����	���6��-���T��:�H�)Uݣ�H@x�	�}����Yb��s�G�\�9��2A��1u*��#E2��y�+ �8�q�W&�g��G�:������K�y�1O�b芛E`&�<✧E�D�:�;;@�8����(!�7I@z�I�5v��O�X��z$P��g���0
X��ca9���>&�΀==^ds���:����%��T*�=bT��p�߭x�؝?��Ols�� >��Ǐ����+8��8��EJ���í�Gs�>A�#?�M�G���F諻�#}t���T����4���V�8��E�N�>C�����:�}Ĺ�=O�%���i�?6�Hq�?�ں	��H���.[zN�q��B�G	Y��Bu:��fd�6�$��q�3���,cq�9 ���H��9�D���	��b>d�����t��~�߲-g H����q-�iH� ��J,��YF�	�����]�`UQ$΀��J:6~grQ ��!�|g��ȧ��ư��@����0���?��J �s $#����/�̔�$��9�}�ۺ�I���cQN��e/u:
��f�$�3G�!����#�U%K9wP�`@��c�/rq��A��{W�O
"�A�8�&���с�A������q��B���v&�����}��>R����HH	1����f`Br2��1V��)�($���;i��B=V�m����X��乶q]����8��e���tNC�<ޝ{��~�!q2tOw�XZ�P��!�a�r���ׅlH�u��(4!g;�á���+N`⻀�ӡk�S7˯qg�CK������E�N�C}�P)A�3��逨EB��J���鄨?�ۆ{b,����'-IV����	���q�d�Y*�u$�D^Q��'��(��̄�$�8��_�H��G��r��H������3��H�{���>���H�͠�6�%]@����iV��p+gE�������V�Ί,LT��)^`�;��#�%;1eq�����}>XY~�<�`E�h��M}C�
V�ڏ�y�3���D������.yu�4V&�T$��a��x
�H����?**���YQ�m�&�V<&n���<����2�S��TJ��f/''�<&�NgE:sg����G+RgE�Q��)�_+RgE���_�_xL@�µ����)���H����:?ly��`E�H�T����x�`EU@K��&���/�H%W�Uܔ��c�tVt].��>�"uVtN��9�IkYuV�Ίl֯X>	H�>+�`E��`��i���m|�ۭ`E�L�����(X�:+�	 e�k��pB�Ί|�*~�惕���������	V
V�Ίz���t�+��:�"h����X�:+9��E�V�Qt����,�X�:+j��P@O:p+X�+���洜��"uVd3��[��!�H�a�d'�jZ+�`EQ���������Y��_w��k����k)��EQ�E��`E���
'�_
V��I���|H�+X�6V�i�o�y�*J�"m�;[���!�� +RgE3p��rN�"`E�Him��1����Y���\�DC��i�-�8Jg2u:+�E�{Ѓ/u:+�F���wJ����YQ�9J�ʸD��H��ۗ�]��X�v��w!�O2�:����Y���%�*�#*X�:+:f�ם�(��N���3�����r8�NgE9إ��=&�NgE�(�`��U�"M�B-����Z';X�:+�D�+���#+RgEWTn���8!���"/I������H��A2��..�`E�%C2*�p�TV�Ί$B�5dj�f`E��^���E�NgEm9\���
V����3�Q�`EuCK}�&~/�H���TÄ���H㝲O�e��"_��<�> (ɇ:�]�Ej�Ġ����Y�I�ǆXa�+�]�P��J'�"=�Ζ�	\�k[���Y��Ͷ5+)�V�Ί�b.���(`E�H���i�>�X@�Ί��G��+7D�"uV$Q+Qv��A�`E��"_��f�<O���Y�DHp�Y�� +RgEW���G������c:J%�RR
�c�B����!�)X�:+���a�l�%�H��(N���+ҋ}eڦ��O��X�:+��3{�on�`Ez���J�\��R�"uVt~���d�I�P���{Ƶ��	1�G���YQ���R~rC+RgE����\lE�G+RgEK�aA�o//u:+r7��    ��*�����Z|̒��v3�"��v���5�	=&�NgE���Ә���H�E�[��Bd�e`E�ȷ��YNEVdG9��r���������e�&�fVdOE�[߀�LX�9+�u�Z�Ǉf7`EuE��Y�.��s���>rp�YX�9+:�/9�i�5���&H2ۦy���wVdG����N�kVdΊ��Y=L������Y�'�Ҥ#W�X�	+7���ɇ����h�(iJ��Z+2gE^?"���P��"��Ӽv�o`E��eƶi���VdΊ�-o����!YM@�ΊƜ�w>޵��d`E&�ϵ�(>�����1�H	>)�1ujY;˱��2�"Km�>y|�id��������_��k������Y�'���E1�"K�h������YQ"SaMxL@�QWt�_�cq�<b`E��ѵ��#���1u:+����,|=VdΊ�_���&�'X�Yɠ۸�)o`E�H����N, �	�Ә�ɠ�5)�����Yђ�P����ȜI��j���ȜI4�Ҝ�L@������r��1u+ZR�7M}����1G�H������Y����k	>0;������n�nU���Y��YU�IN++2gE3dZ{^|��:S���Yѵ��/"i,�NgE=�������YcD)g������:��Yݴ��M++�Ɗa��[J�L@�Ί�Xjw���o`E-��eW��.9`E��f��t1�, �s VdΊ<��-�������&�I����6�"sV4����i��	�����l��I��X@�Ίdy�]&���%M�U�y�L)+��+�*��@�pX�9+���&�u+2gE�0%�77+2gE=nJD)u3�"sV4��Ʌ|1D[V�"9�s�
xq� +���NI!��`8�NgEWp�id��c�tVt.�9a �Z`E�z̵Է{f+2gE}�ӥ����Vd��m����zX�+����砥��	��dM�����	Vd��"��T��c?X�9+�%uxu]�����"�R�R���ֺ�����Ǧߝ���Nf��� �]�c�tVtDh���i����,�l�w�ٹ�w�N��4VdQW4\Z�����Ȝ]39�0��+�Ȝ��UZ�Yn�g`E欨�7A�H#X�9+��2��lk`E�h��hܦ^�Vd��头+�`E����A��X�]��=7i8�Ϋ�sS��^CV����3�n��#W�X�%V$�u�-�ٝ��5p��7?&�NgEg�k���a��n�Q:RS�8��X�9+�����!��X�+�&JO���1u:+:̽;+5��"sV�q�RK�9�����Y��6�k�Cf+jG��,��
xLL��9��]�?|�Ǆ��-t�i����`E�`Űl����q+jq����傈|q�c�Ä�;g{��F�ru+jq���Qw�x�&��)��:r��c�	ֳ�>A�@y����y�V	u8��������<6�ź�6���H�g�.�z=L4���ȫ�K�������A1�2GȏPg��h�]�/M/uF�y*j����Pg��[�o.Q�%	`E�Y��j��rR��VԂ�X/v�i�f`E�Y��X�NE���VԔ�;ۆ��C?&���A�g�"<	4����\r�w�#0u:+����V�{�Pg\2�s�UB�VԜ�hoX�r�.��9+:���]P
�tVt���U+��������r]X�~�l��5gE�|�Rof�Wp+jQW�kߵ#�XQ����u�z9�*`E�Y�<��LJ�VԌ��c��s��c�tVt,m����9VԜ���z��/u:+:B�����tVt,=+w�����H��S�M���VԜ�R1\��k`E�Y��J.J����Z�:-�j�Ä��9+�nN��j���h6�e�!�
�	VԜ�eV�3��L@���↕���	u:+���٨���H�&sW���:�-)��r�;XQsVt�-L�<EXQsVt��P��2�V�:�)�������`E�?te��Y��5gEc�������V�z��,�Ԍ!XQsV���W��2���Z����ֶ��ꌺ�ӧԮ�	���֯���3����XQ��;�殴�y5��-K�c?��XQsV�q��O�4��uE�E69�	�6��欨G�R��3ﷁ5gE~�J��(�_+jΊf��Z?�;0<&��`EK��|�t�1XQsV4��ym���Z+jΊf��ZK#9˴��`E�v�r��r+jΊf��L�zL@��dn�4b����òİ��c�tV$g�ys���	V�N�w~x/4XQK��&��)��1uF]���.���1u:+r2Q"��SP���s�Բ	������Hc����)�x��欨��d�0��5gE�|��}�}Z��P�E�S7װH����5gE�4!uOe��c�V�t��4��VԜID�k#�E+j�|�f����V�⎢�9�c���V�.V@��0iA��(�M���m`E�Yѥ>tVb��+jqO�rC��"�	VԜ]�^�Zl������^ m�p����9+�~��%	�?&�Λ�mSc�;>&�NgE�>.c���V�n��r#���VԢ�hfܖZݜ��:�i��n5XǢ�ugE�.ٿ���`E�Yѭ�77�(L(L(f�m��{�w��~��z����Vԣ���XR�S���ugEg4��F��;n��z�+�����)N�p�q��Кu��;+�)�6q�`E�YQ��k�h�+�QW�8���`E�Y�X:����E�����u����"P��"[*����x�-XQ��d�b,9���`E�YQ[��6W۬�@+�Ί�/I5��;+��ؾ��J`�t3s��Z�)�NgE~wS�3��b�`E�Y���5_��o+�QW4�s�@�Fk��Y�ͅo��d����A���0!1��+;$��r�V�1u:+��V�\��)����rg�}.J�Z��;+�_o�.����G���*|D4'����6\?*XQwV�ù��|��ucDi���Ƿ.|`E=�W�ү�^@,��;+�g�Yiݦ���Vԭ%]��<r�Vԝ��EI���"P��"mrS�Vԝ9��uS��Vԝ�8LT���S@�QW��<9J`E����M�ov��zc�gy٥��/Vԝ�q�ce<dv���H�^饊%���G�Pbu�d�tV�L�m��u�+�Ί$������Vԝ�?*��f`E=�+� �$mtu:+Z"�7u:�`E�YшPq�H��#`E=ꊖP�>���ޙ/�`��Ι��;+��Cb�Ƨ}��;+:g�t�*|����s����t]������{f>���|��ugEm��P��L;XQwV$s�-=�>�_�	Vԝ�泲^���V�GQ箔�SZ`E}���m�����1u�������Uk���ugE�v�m�t6+�Ί�{}I��m�P�`n|���oJ���Q�͵�S�;XQwV��	qSti��r_�oE��"Pg��[fe���Z�Vԝ������
��ugE#Ƣއ�\���h�Rc�Vp��~�xg��!9w��������#�L;XQ?�D�.�l�XQ?��%Ք&�����(�JZ���ugEm&vM������h!���M�:XQwV4ah=dJfE�����v$���Vԣ�r9Y�S�������Nݤ�~Jօ��;+�"�j׈�XQ�J�p���R�����h�3���Y)p���(r���/�"P���y�fj�~g+�Ί|�)%(%;����kgN>���+�Ί�8d�� b�Vԣ�h)���h��V����4x)e���;+���֞�́�`E�Y�bb�^';XQwV4�(5���Տ	��YQ[
�7mf�^�ugE�j�M�hZ����͊�\�O��� +Ί��(l�b|}�V4�-�,��JYM(Lx={��m'� +Ί��7i���h8+Zo۴VY�h8+�^N͔*	��hD]т�K�V�������-ͱJ�� +у.*zv�o��	�w.wz�J/vg`E�Y�_Z��0���X�V�,rۻX �  ֱ +��M��=)��tV住ύ��f7�h�}E��tW�����h�}E���#͝��tV4A��m�	X�pV�U,���{���H��f�N�V4�I�W��K�X�В�YnF�W6<&�Ne՛�/�A����uE�?j�ٙ�8����"�0a�_��� +уnz|ō���y�gE�<!y7+�� +QW�85]����hD]�>�f�" �:��������
V4�I�~YrR�� +Ί<�����t
\_�hD�h�X��Jv��TW�ã>S��:���,w�KvX�0F�sc�0���h8+�>x�&,)��h8+��R��HuX�pV$1uO%`E#ꊖ;Cw�-c8�NgE}�	w�Y�	���h,��d��>&�NgE^�\:[iJ����KvE��i+Ί�rBܴbZV�h�ܿ�v���ď	��1$'V��P��"����k�W�����Ǧ惛0PgcM�/�=�>*����S%bR,g���+�O�+Aa��V4���Qu7ٱ��^�Y0��.%�	�3XQ�CTm��X�pV�Kk�MQ�
zXј�HVw�l�	V4�-E��D:d�gE})/�o�V4�������%��hD:ۉ9�쫴��F��9�?�}�X���׌��n�1u:+�=�*w�zL@�ΊΈ�W|p7+Ί��G�Hዀ���h�u��Í#X�V47��s �V4��rW}��b�V4k2���}�|�V4�-e�$�\�����	бs� +QWE����E�����;�Վ-c�+'�@>$��:`E�YQ����b�+���h,����� +Ί,tQ爥�
u+�Ӭ�ɵ\�;����"_�J8H�MA�h8+jQ�Z�y�� +q_Ѭ�h�D�Q`E�Y�X�]Y/:W-���H璳����X�pV��j[ֹJ�h8+�i5�X��XѨ��Hi��c�V�����ˆXѸH2feM0J�J���h�=V--��Y�g�������h-Y+q-&O����ù���`E�Y�=|Vegg�� +7s�dӅ�n�`E�Y�W�.��X�pVtv�E��KKX�pV4#��Oc�":���͈R�ًC&�Ꜭ(�s�!^�Y1��ְ�(�u��ΊlA��lƾ(��ϯ������      �   �  x��X;�G����X���+�P(@�#����?dO��h0����|���_!z���ы_��4~��m�Ƴ��M]�}}_H�Ȥ������w�qC˫.hF.h0�4-(�����1��=�y�m�����l� �lh�e!|~��� F���m��偤ȶ�ie�g���k�5����o�z=��OV7!HsD6��3.�*�W9�+C�h���p)/�i��VK�Q���j#�^t�M�.l��]~� �lK�����()	�x�L��Yg4ZJZlz�x�D��~�=��B��f�����S,f���@�壵��$�I�-jJ�6�ir�Tj��C�6ar$2
2),���c�I�����-�9��J%>�U-�Q.�߲�[l��n@>p�N���n��VU5�o߀<�#�ZS>�!����1�Ѧ�ƶ2�%)�
K?����n(k�l&�� ��)j��7��L�W�$�x�E�	�o%�Y����j	���E�\*��d���;m���pچ鎛K�X%�A���.вâg.����C
*{*�9GB$]�ҙ*@��T&�]r��~eRTh���1-A�R-V�vW��MI���N8'V���[ Y�������w0���P1KMC��{�����I��B�iP��8k�w�YVnƪ�h�T\��32��h�Y|xH�fU'�9�<�3�[ّ9Im�y+�_z#Ȭb�5,��Y��lhm���6ڝ-6�*���s�P�l�gQ�;�
R���+$�Na�C��ݪ��c��ZAvɸ�##��쳷�6}��V��~�����}�8�N�9��c�#p������5��]�z|dɤx6!�~�^]�ֱd˚��)M[���3�%,�&Ӿ����2���V�����u)��D�k0���ʷG3�Δ�,Uݻ��h���(��p)�������֬�f��h�<���|̶4��Z����>��G��ѥ�)a p񬞯�E�ڟszc[�A�_�#�K�{�$s�}f\c!��b��!�keb9��|H&Աݢ�g_JT+��(N;�RU�QsόV��&�<�"��+Z�K�0f�)��8�[�ӥց��7��ԃR�(!��H3s%-�*)[��=�[Dg����~��h=�����Zq�FOw����N�U=_{���r�4�"{���p��Cy�U�*}�m?k��hMz�r�@�ޯi�k,/�P����ጻ��~}}��L��      �      x���M�-��^ە��N!�#)�s��p�@�
582wJ�"u�n��0wD�D.R��������������?��u]�oz���s������������[��Ka�����
;���ƶ3�ٯ�����^;�v;��7ן���{����϶k�k�o�����[��î�����x��?zm���������y����7��=/�����������.�����k�vrEC���s�������$�֯�^ń/#����Q��A�]߿?�@3bKWz��0�ш�~���}���P�����/����!�k��c���@72�p�O�U4B8�����?Ã!�#�ʑ2�?�,>�B9��Q���0
��>��/��KxT�rt.6����h4�rԶJ�*�=DA 
娯G��q���P��5��Hn��;B9�q���})��c��v�w����{-�E�iIU(G���˚���2(��_���?C�a8ʱ_�|Od��
c�eP���yv|O�0嘭��*�� r�rlnT��:��2(�گ z�9���q��k����+�#�cc��ǑˣA9v��#-V����{�Rx�j�C9~�_LG�#<�C9.k����>~���ͷ �ɗC9n���q��9���7�}&w�E(���O�w�r|:9�{kvD�8��s�)��u�ˡ���f7�3�aZ9����S��wC9�iךV�U.n:�i��QF~���A9M׺z��ѡ��4[�R���!�����\��<n��imiU�<��kPN��%��
��崱>DUNÂܠ�voG���gM����u�r�����M��PN������y�+y�r�n�;��0X�r�T�e��#*�C9ݗa�Dޡ�>����
С�ޗ�������C9},���ߑU�t:����r���� ��>�����gZ��K��?�Cx���_q�.�)����U�K�x�匽[%�����1���{�.���	P�h;TțηG�����T�#��k@9c�Vρq0DPΘ��9(�4վ�3�%��X]y���{'Z|����rnYs�ďB��rn][�U�����P�mK����p�n(��=����ʹgT~��������}�/e�{��P�=��r�(��r�{�+%|�~ʹ��<_n`G~��'�h#b��y�W�-��g]���<z�d���@9���W|�NC(�<G��+@���<m�$os�_���5��_M!��<����<��|q�z���^�P�k)�z�����C�;z��t$,iř���.��Ԏ�����ő�Ka9���ż,�r,��3r(��+�i�{�J���=�J,�^�Ky�1��ò�H_��:�ZXεg�}�g�G�^����ӫ3�%]����?�G�p�HؤJ���ZBC"kY���Y �E6�I{��WS<-4$�����5O��E&�y��S�Q��x���T�.�*s�_Kh�C���U�2`e�{}Ǵ&x�~\Ydg$�(^���E�z*�^�ZBC�,�]�S��ZBC:��Q��5���,j{TJ�ąZ �Ew����v8�,�.��)�-�!�������8��ˢc���LX�� ̢�i����i��E�˷��_��1���C�U�Ylz���R��ZBC����^[Kzb$Kh�l��Wع�3�����µ�Ylz�v )�+@�|@���sE�x�fY���z>-4d���W~O��%4ds��X$��,~�W;���	�,.���s%����⺣�=�f�Q/�#)�C g�(1�E%�8��5u�fՀ 9�B·�̷����,��!N�@C:�������Yu���9Fc�,m�B9ĪxZpgi;�U)��k	��`�2�L:�Y�-�YQ|�ぞe���e�ZBCmk�����YZ_q�UjO.�����ƚ���LJ@
𳴩!�+X�M���͜�f,�_ -}kT���-��E�O��p����^@5*Z>�JU.k���������xwzZh��=�
�s����ҧ?T򂙄���P�}�ν Z�}���o@,, �ҧ�<ۏ�gP�LM�g{���Eː���[R�`�];���A��-c�ԅ'|��qM ��1~��D|-cg2J\�W i�d�*q��Q���Ԑev���ⵄ�F(�(1o�:��eL�쟒�� J��l��n�'��ܲ,+@O��{�Ԟ��O�%�2pi�m?Y����i�g�3;Q�i��i9�+i���{�^yT$��`�r�5�uMH;����mQ�Z:-����?��X��e��'�z��Ӳ�t��J�� P˳����C� ��츬H�?�����?�H�j���i�i��7c��g�ev���7Pjy�~�S�)���g��%5�Iz�i��g������
N�ᝬ�C� �Z���V�X�N���C}-s
N����{�F:
N��ֹx�s
N�W�q_Ih��˩���,Ǽ
N��X���$��(8�^SC�-s��|`���z��g+8�.N]�W5{�
N�"�jF�bI(8����#	(�k	��Η�^����U|Ϩ�o
N���B
�2��U�܎e�q�Vpj�����t�Y�j�Z�^~B�}��
N����,��`�+8�N]�Jy�A��Ue�Ft5N���ee�M<A��Ug\Vʘ>s%~[pj]E�z(`^P��5p�Z<��a(8���Nk�͵�Zu�2W~,9*А��7Ky �8_KhH7c����	N��So�$��Zm�I^����Zmj�����k	�Ԑ�E�Z��J]�Z�׼����Ե��J˯%4d3�Z��g���8���J!e)PWpj��!)�ɜ��S��Ԝ�+F·�V?jt�&��S��
ż��{��АϜ�8��pju[# Y},wz-��ȩK�S�!pj���g!����V�K}u�&�Rpj���U�C���h�d�%W�)8���:şX�������TŅ�.�Ъ�~��mVpjmӧ.��f�����f\VN��:��jSC�����N��-���w{pj�E��>X��Y���Ժ��ǡ`4�����.J�
N�m�e%B��jP8�.N}8���Sk����=cpj�x�pj�����\�+58�v�cw �Opj]��-�C5��������=8�����|+	�Z��G尗a��־O�������:��})�	N��f��y?�*qT��u�r�R�Ĩൄ�ƌ��3Ɵ��:��Z�o-�T��Τ�,f�o��u츬�	�(8����~��KD��xBCc֠���U�[pj���T�1/��Ժ�����ʤ����W�1�i��{�\�}�7��{k���)�'8�ޓ1b��I�S��ר����I�S�����h�)�y-���ޫɁ�af�S�c�ʇX�����l�Vޗ�!�S�#[/ef��C���������,��'�5,J��z��UJ}յ/e��Z�]�:�3��������S'�N��S���j�S�,�>4V~+8�>����=>��S[`$�jP^K���Pɜ�����-�SW���3�K[3��OU�Nm׮c�{YCDg��v�u��C��/�a|�#q�4pj��:TǓM�ڮ�o���Ά������,���S��}�D�<Ad��&�~��W>ai��&�(P�R���S۪�.5K?O���ɩEr}��c��%4$�~��
[48��>����1�j��&�&��C�O�8�IX�
e����mr�ﵵd��6��n��f|ZpjSYJ���y^�6��+b5��S���%���А�ڏr��T;8�-N}��T��S�j�Q*8�2���M�R|U�&Khh5���?�6�����<�g��fa=/u�ȿ�АM��$-�5��l��ǜN�-8��z�VO-�#��f��E=xysw �6�9�� �~-�!�k���8���f����i��к��}����S۪�.u�xܗ�S��U�fIҷ�65h���{3pj�} ��ԩc8�N]"�D'��|�eefK�T�%44멿�c�x�����٠�j:w^pj��SW�����|נ�*���S�o��:
#8�-N=~_zZpjk�k'������W��YNmm�˞���d��Nmm�\O3;y��Զꩯ�y�;=-4 �  �8u�y?'�m��6֨�~>��j3�?׍s<����ؑཁS[��N����"�>�B�����ң�ɛ_��z�c,j����fS�ڜ���8���U�£�Nm=�e��]�H�Զ8��{cf�������a�i<��>5tj
�-�S������U�B��6fکIO� ��m��ʷ}��Sۘ*�k�3�Nmc�:*U'{3pj[��6�h��S���\�"ɫ��1�,+�Yy5��YOͪ����7���ס�7�9 ��{�[��XM����P;�,�|Zpj�����X�t%3pj���Pg�5����S�z�32pj�w���;�
8���}�B��5pj��>*c�䗽���l���������w��S%":pj{�G�}v�y-��'�e��ç��g�e�z�NŃS۳��AC�	NmOȹ|0����̽�P�r�NmOߖ�Ok<8����|Y�C���̸�Xz��1pj{�5vǎ��=�ڃF���p��K��y�0���Ծ�g�x��4X�x8������>9�1ϋ�e���]sW����~������f�Hpj_���-��eh�y8_&��,w��Z#J���Ծ�O�ٰ#98�N]��t��S�L�0c��N�b{F�JOfN��g+���r�c�v��C�R#�&4$s*���4�v�>u�����]�5���T�v	�cV�e�Ԯۛ('dәS�v���S')���5��(�gc�Spjםs=��1^qpj����0�r-��S��>��n��a88�������%4�szL�ՈN���z{q<�!}�;��o�ppj����5,嵄�&�>��"S�ZBC65T�;\9�tpj_���؛J �����/�O-N}�-���m��)�[�y���B��;0�����KG��_KhȞ5�J�y�e���>�L����쵄�b=����}?j��g�D%�S����ԟ�oN��{6����7�!ok��Xp�{��ũK&�D�N�>Ϲ�USs7]�v�:����А��Ѡq����n����]㵄���C�*�w�������vzR��:N�S�3��gߏ:?s㵄�&����������m>TOv+�pjo3.;�+̯88����%)�*���}���z�����Ծ��L"$WS88���s-�ˮ��S���!R�k��gߏ��U�7N�=4�=d�1W����s��S����ϸ쪕d�d��S��?�7?ON]n!�m���}�S�,�� ������7E�B��>�?T{����YO]wޜx-�������������B�e��>�?Tꌯ�ނS��qY9Ud�,��S{��5K�>.N�S�ݞUzN�c�e5���N����N5�XM��}��(��*q8��{��l�S;8�/N]�l�́��o?���Y�3N�����Z����S��/|jv=|-��ũO�}Z�������Sk�R���S��,��v$��ڟ��k�?�pj_���`�k��ڟ�]�R%�����Zؒ�ɺz-��ũ��ɵ�N���G�W::8�?ӧ.�Zs��'ܥP���=��'�A+}
�&8����UC�+C��[�+�{${;5p�8���%~�N�f=u�sg���`95Tj�-���r�1��aeC�n�����i��(����|��
0������O]N�y����S�ɩ�����S�UO}ʜ�⼁S7	;����А���!�������^s�3�V{-�!�k�K�'��Аl����$���-N]��[&���I_����f�N�d�Q��I�����츬�>�ng�n򬱫y�����m�S���RY��*y�l	�_�e��I�n�{6�
+Ƽ���>T}�t�8u�}�K�W�J �n���۫9��WMp�8���¼�А��C�j
����m����=)�X�S7�䪞�d-l�n�k?j&tⵄ�l�l8]Ճ����>o_w���S7}���ˬt�n�u�ƌb�n�s����Ո����{���W�AC�un��xBC�So
�Z��y�ӅV�7�������)�'8u��'�T������jOlv�i���wOϺ;H�BАo�XOq�N6p��S�f4N��>���4p���*�ʕ/�l��͟��C�����m�S�2�����[�{Y馝���j�߲�1�n��mq�����Y�N�V=�8փa��nm��(�3uGo��-\�XO&��S�ٟ�/5K������x��o��mݏXN�J�y��[��6*��j8u�/l��a���S����5�%�h�ԭ���%^����EN}8�S��c�S73x�ԭ����Pe�������QL�8u���Q�i󷅆��:�ʍ��S�՟�p�{*�����:��wAp�6v�ڑ�U���[3��y%����m���B\4Ey�%44v��ZM�V0p��~���z5p�6�RZ�+��l��m��1�
��N�f��ICSf�S���5�{8u��9�B�r�N�ֵ�%�y* N��}ε��a%v�nw��ʪ������ݏ�Էs��ݻgCe�ځS�����?>p�v�u�z�i��n�����u�7��Nݞ��K.2�	��m��(l�r/�N���%ϛ�^Kh(ܠx�Є���=�*�X$o��=����I�Nݞ���e�7�n����w�6�����ԥ#^��|-��՟Zku���{����.��W�S�ȇ7F�S�k�Cw��J/�N�W=u���ܭ��S�՟�t3����S�ũO{3P���{Kwͧ�:8u���N~<~��ɯ���W:8u����^�CS���U�+�7������^��ڬN�'��'_���ZBC�?�!��Iup�.����8*��]�٠cH�'48u�E��V��z6�:�E��S�ũO+;4up�.�~�֪��U��S��W��P�q��N�u�~�3�W�ᭃSw����}Q}��]�9�Zui .����_o/�@�:8u��[���:8u_��K?��[pꮡ�t$�􅠡��C�$���N�W�˫ɕ{ptp�n�N��CO_�������x��Sw�w�ճ$==-4d��P��YO�����ڏJ
�{BC��P�^c��N�m�e%��|�x��TSX������x:}�N��>�KM��:8u_�ԭ�4��[��j���誃S�UO]�F<ߊ�����O��>�xOhhq�~�}�	��ԥ��䨣�S�u�b����3�k8u�}?N�7�$�����G�|�ON�Cߏ�Ͼ�a�S�ũK]��x��S�����x-��՟�DWW���ZBC�?u�YΡwp��B��t:�
��k��E�����'���i���m�ˎw��j;���1i��S�p�b�˒�N�{��(�]I�;8u�3�/��5;8u���}�ߞY�N�gj���cN����˜� 8u_����J3���Y?t� �'��S�~o%V��>p��wl_w��a�S�PO}�O�&8u���tW.�e-��П�v�"����}l��fup�>�_~[x��}��d���� ��c�C��vc���}q�������}����E���������N�WߏC��iy-��{�C�
+h���z�q��O�Mh�qY�]�8u�����I�������q���9�N�g=uݑ4��-��;���n���/N]j'5������5h�Ӎ�����3��s\V�p��l�2c�����}q��G4w8{-��gנ��6�������N]��#�S������u��S����t��|�E����{��4����}q��fO組��}ε��a�x�S�8�Ng��o����������      �      x��}i��:���ϫ����᭥���fP��A���[( O*mK�A*�R*���o�RH�_h�R������,��}��I��/�����/Zf���Y���_����v��x�_I�C~�],fQ��ē�D���~�^��A?(�g)�5�S�]�_�Q]�	x�(^�~�_i�7��I~��n�_kƯu��F��w)�w���Ƈvl6��wn��o��F��i�FY����f7��O�h#�������g�b��R~u��E_�߹�"�~��V�����ES/")��WK]���"ڇ,_��:�Q�{���Y������i#����M~��G�\���^�U�h����A��*I]ْ,����OH*D�^�V�b!���WSdM�ne�� �N*[���h����[}S鯸f��aD�l�(����Vs�{M������H7��G���F�z�-t@�<�\��-�k�3�����yBZSg[W�kW�I����fOd��d���JŊ�V[2�-7֋|^/\�t��$�	��%�	��݈�ΖLP�xF�v�Z��[|SN�$���5���z���c��EK���O�@��ȮFz��Ӊ+���q��D6���[P�6d��'�W�Y�3^���d�:�L���k-��_��,���'�(Щ}�W�)no��4$>�ŵu�߮\�B<��*�Y��k���#7A����=&����r�@Q@��O��-@�A_�E)ߗhC-"�7H�b�ιY��KE�^�	�g�mQ�'a�e�B֡,����s��U=���N(����W�N@O���jcq������_o�&�ѿE�+C����c��J~���쬃q���x��"^b�Q(I�(",ܯrS@����:[�O"�5�C�-�X#�}݁J4�c�L���ǅa�ޒ=k����H]ɤ@n�?:l����z(�I�<;yhJk���}��J���n���n3�\:��|7��J:Qx��d6��i��Z)޿�gI������7x�&��B
Y�JBTF���g�j��B3��������7��-��A���ZR�o���E���	�v�l��OWO��@wԁor;1��8T��7&���!<���>dX��d`�=����7��{H#2iz�o��x��خ4�8�Q����oZq�|�j������$��&�b�7��x9'�4���mZO��l!Z�%U����v����Ib�;.�'����xK���\`�	����%u4eG@I���k��<v�jÑp�֒bl���K�v��LF�oK>.ahWA9#	Q���ӊ
�ȱ��2���p�O�� M���!�}���dc2E$�5�ϥ�(��6�r��$�9�d\rΩl9}
�����z�S��L�@�[>&�p��<cp4^H0�L���R
�@h����rV���Ϥ뤌)"�/�R����_
�\�z&������<0�d����=���2E�R_�/�-�x���h;��S��b=��/ԝj����� +�mśq턟�y�Z�H��;�5�sҌV�>%S.'-��bJ�`�'}I񥓎a	C���,/(E�H��K�"�*!�Ud!�J��v�� '�b�����(�撪ʣ������)wQ�����t�n��� �U8Q
f��y����ƀ�%a�\��b��4��l�pD�,���G��H���]���M�'D��S(�O�t9�F�22c@����<����+V~uI�2+�[|��z6"�F21K˗�s.��0j��H;"Ý�׻�*Z葍S��Z۫��V��"W�e¶��
/�|��((�(���=�QUD��*9�����V���!l=�,��~0Z��:KJ���WA(60�h���l �}e:��&��D���V�aK)os�=p��胀Ͻ����e�cj|Ĺ��ǫ��[߹&��5�Vy���UH�����،��B�a	�^$�?#�b�Hp����A�����.R R�"r�IC���6#Z-;�
�����qQ�����}�N%��KMɅ�g�u�/�,[��*�� �L�@i�n��3kߺi��\�jd5����w�<�b�6{_56�~�M�d@��'���0R��V��2[�<JC��{�ʡm�p\2��ҿX�4� ���S��\ĉA�-9Ιh��V�d@�����
2I�bA�l{��x�B�
���E��1���HQdk��+zLkv�-�Bq�?}�ZpN<��x�*:�v2�n���.i2٤��4�{d3�""�\^�z6��	�8U�%t��|�0:�lE�j�n�7��q6���bV�3d��k�hyI)�(!��b���K�E	!eYA�{3�����3F�����#�v8u� �AϠ�; ����V-������|;�VX�l(�vE��bf�*�1��)��K d�c��*��e3LE~�N���	N��u ���v�|��bWS��U�� �g��r�nް1�}j��n���ԓh�m#=&�KJ5n�-H�ڱ�7���urܔ�斔S�U��2�El�Hċ�a�I`F��ѷ�dk=��9���0��!�p6�5m���w�uõ�V}&�D.}b���&�����<&�Y�b>��!1&]7�}+j�
T$���QV��������"��n®�'Y�J�E�s��y���Sz�/Z&���L4�[C��n�$)���h�J;���0FG|����;�[T0����Ǻ߱K�/�Q����O�4�i� �_� ��Dp|#�(#�;��
���1V�.���^��j��I����8��[��p]�yV@�~��ڣC���&)#�@�'��j.�dP���b��ۅ�D�b�֡�}�-�h�9����D���i�J��1�qo(�u��J��cչ����@��*��}W�}us)����	������VT>�M���K2%�`iX#ɏ��ޖ�=L�I���6��L\��BbrF�§b«�**.��~�rY����U<�(����W�u����%96J=Τ3�pB�k�_=��>����˥�S(��8�~��)� kE0Yr��#�D��2,��]�ǒ�]��u�M����"��hEJ6�*F�iUF�k�_�(����?���[���
D�Ӝ���?tq&" [wv�-�C
�1�Q;�L.>�#����px��|P��׾TܲaޟeMs^��������K�!����{��KX��*�K^g��W�w�. L��;԰���(
BN`"����������YB���o�`ZE~�|��Y����U.�L�$T���ꑔ��(����q����Cm�d�廱Wy>k�;�d~�]A��(���P���~��٦&	v�O��0]�-S91�IO�U ��U���d�x>�E֚����'Y��ʗ�K�8/�U���;ϱ�*�Ny��\� �$'�|���n�fz�T@}�dt���WW&�&x�ͅ�2��=�|����@�f�|NW>�ZA�SM☎���,����46��j�� ��*Ps@��p%��C��}���̸�L����dc�h�c�T��s>1a��M��I��윁���t>�u�� �^X��Y �=���^�B4>���dr��<�Dta�������9�t$'��ŏyd�,]�Tŵ�$3���('M$�s�FW�l���'�R&��y`�b�8v�:.VMW?�+�.$*_l�����qArj]*��0��3;��S֤��7�z�T�bkn�����U�1����]|�����L���p�2��5'~��u}��)�������O��&S٤U�V�	�k�<+i��VbR�)�ߊ�Ə��l漾����3׈�9�݅1���D�h���Lf���J�T��Ag��uI��%O�@)l ��f8[3u`��шL����\(djL*%%.I��h�KZF{�J��i��Ծ�ꗁ�ԜU4d��wCd�ދW�Y���d���<���S�
$�U@�GN/��*���F#�Ovǅ>����	E�4�����I�:	eD>�����;]˧U�Ǒ3l)�I����@G�Q���n��zVe� ��t���4&����|��    �oES��3A�����.�F4o8�����F���u��'Z����t��Ql{P$� �>eW5�DI� ,�ĳ~�ص��+pбx療�u�E� ���Үz���n��W�H�"x��B�^E|N�L�y�Ξёm�E����ץ���9!!D��j��d�+���T�P?G�.3���is���F�p�k :m5��ش����#�~ȓyx~��h��h�ε���n=�OSԄ)&��A2�}j=����E���~��M����Qa墄諁���`�c�򌖸����^0��g��-��`alZ4ٯ���Ν����Z9��k0���c��̳�p��Iu*��o��Kn�.9s*����#�J�%�ޠ�}�}�^t��� ����K�Z���q�R%�7��{��U���u .#�3ۋY��j�F4�Fv��EW��=F�-�֢�߅PF�97!��Ns����-�e��px��r���7D�yy߲��c+㖚�m�+����ţm�������|�ɡ5��hQ��dS ��I��'��]�F�3z���v9���P��@Bsd�˗&g�uH� ��*�(���Z�u����)�)�����,�i �䐛�쿕��67���5�a��K�����B#�6�3����e<P���.?�v�l��d�j_���P�Da��K޾K^uȭ<����͖q��d.S��D��FC�z�>f@z�mu#@�,*c
�H�yr�����@2"��[�R=Q��&Ww������ ��I�4\��h���AГ<$�P(���&�sy� �����)~�]R��M����:@N����,o�u���,������w�*W���q�X�)���k6CQ�r�� :�P7Ҡ�Z����ҮqJ�����Ν�tO��!�X�m��7֎�A��PΣ��V�Y5�_>'��Tc����wL�~��3�1eG�w�sɀ
��A�tF#�;SA)(LvTP��󀌈��=Dcuf��Ąm��$l���L�CB '��<���8�ʱu;�~���&ф(.����|Dc�`���$Z@��Ma������M0�k�e��8��Wyʹ�� 8"��ӊ���F�{�)��b9d��JS�4�l_���!r �_���v��P 1��UI�&�t/": �C\��w�vLP4�����&~�`P@P�I��;�<����J�� ha
:N�����]Z��T��2pvi7 gk����J'_/��*V�Ga��/�h��U���5�꿿�v5�$3�xBMٿqC��Qa�
��S��iI2E��`Z��nԢh{�2x� ��]�w
bQZ4X��i�v�_���E7����[.`���gX��q�19�f.v���Kɟ�H���d��~�����D/AM�%�%&�wdFu�-Yi�.Š�w�p��st2O=l�����k�)z:�L`��3%nC�T�
h��(ޙQ`T�_�<���5��<p �_I±9���\��״�}nt�+���z���s�Z�`��U��FTS+��%�9y�b�uoUA�	���%��5M�bb�%��2}L��5�#�d�LGC/&8]Urbo�d�;N�@�\�c�(��a��&����\�ɯ�a<�9x��QS�b{^姍J���X�� ��CE";�(fZ��tF���z�d���@â�~���4R�M0��5�Hm؈��I�(���v��-����n(��f����$k��]�N-<Ne�!�m܁��<A���wo84jR(vG�ĺٽ  2�E$��h���c-�� [U��N��Ix�|Vc�	��|�jo���;���3�����n. 2A���ƻ�4�z�q�xV����:����J���kߵ>��s�.�)� ��t���9�x�]�$H(I�o�A�מ4`�=x8��E�r+�ʝ �8�>#�]mL~��1a?�3�#_���a,M�>��M-&������.ۮ�����AՎ	yJY=�KÅ�;? ��e��~�#�˄h?�t���7-&*ڃf�\s��q�Aݦ�s�` �dO~0�j�|��Ԓd �h��h���^Jw]`;X�"��������m��fY l���>�N�4�9����~ZnБ!f���vƔy� +�^����"��և';c
�t���弡c��&��=�Azl��h�(���δ7}-٤}��>�����(ԣsr
�Ad�a��,Cg+f$���:Y�s����Avs+�Um�v���q��	���1 -	r���R>�-��M<��y]C[ P�Q�=	�#2e;�Ik��/�E(�6��7�@�<R뼗���ؖv>yC��l0\zc�L�/�x�Skv�ڗ�l�����qO��1ځ1dP�����g����Q��c�N"�:�t���h�גw��g9h�Z����E$P������C�D��Gcx�B���6��+��B�_�b��O�w��Բr�ر&���-8�����eN�)1@�Xq�Å&���}�BT��3.V��a�>��*���2�0��ޘ���[�/-̮pR���q�W�w��'�p�-���O�b�u���Le�sh� *F����ӧ�-oՊ$�{��''N�,Z�O�q�9%�,�mL�K�\�de����+_h��hn5y��ǀK�Cot�g��c�������zNp����I�>Z;�}~\8����Q.`�e0bp2�MP�'\���H�Z7M.����~U.���y��k>�uk93�	��U$og�����Q�����t�%�R��D��Ɨ�l��t����Mlz� �����R���	�0��L�d�,�K�r;.�]1�cH�U1��gvU_�q�.'�V9�4픸���aGf~h�p��n�{���x��h����r�uL�h ��$	�7�O�w��n� fg��#zU~3�C:m�%��ܮ�@B���+!{������}J�I��&��mv{0�ȎW��q`�,�=z��50��e�K�}0��t�#$���$��
��8��+��p�(��2�1���\q�#d�Re��U�:^AG &�5YF3z��Lȹ�)|�y+6޹;�$��Q�C��Vv�ʀ�* v`�@��\]r�D�5@����k3�	M�h+�Q��>�6ϓ���S��bX���@g����my�]�"߮��L���V�����=?.#@��������5� ��	�i.�Gs ^�Z�:�ph��u1,��1YR�a<���.2x7��0�P��X�������T+tI��ԋ�wr�--B��TjӔN�%�M�'t��>����ܮ���޲��]T�_��k\B9���H�/ײ�MZ=��7b�ƟpM��p�|齵!)�"eD�`D��vk�SF�@������j�X�˂��jO���L�qGn��4C(r}�=z�΂� �����D�1�������t���@�_�o�
,��#7�!SL�x�����e!v���c#��V���`%t �m���h��-�{� ��t�-����k7�6[����L�[�X�ĵ3��Դ}b�k�Lw^�Le@q�2�<w��V����F�9�S\|��Ix���j�=��
�� Ay�����ie��/>��_�ել�JO`>A~�Yi�*�G�u}�(�:����j��O���~+�m2�M�p�z�7�U��R{��5�c#�<����t~߱�}�s ��EgӢV-�ƽ~��|5,_���B��Ƈ�W]g���\8)Qp����-��ȃ-u�R�U*�7 rW����Һ����$t��y�k�SR@�c���f��jC��0�b��Bk�;�E�� %,��^'�J�&]�:YP}��Ns�j���6G�_���Sq�t[,'au�^��\]L�����O���Jl<�+fٹ��{
,{�:z�uI9?�)�6_ �j>j��V1��v����������$>�n�U��t��Q{�uNs%��$(���WowU�M��1���iɤ�B˭�by �  ��	���������P���j��5��lN�~31z/�L�<����S:t�Z�7�*\�^G[���㹒��{/a1|�D�|�y������\�[7W��F\k�1��"h���75-z��2Y:���}�����zc��˼"3�UP�x�E��D�3dbv���r���uOw�&&c����K)QM|�*��]�QU��z�]�7B�̦q�hu�ߨ=[��2�W�u��8Ї+����"�VU�2&A3n�������#�A�c������ ��L�ڄ}��e"7�ܠ�r~��V#R����K�mh�wH]>
B+�::3b]�w2Ct.���Y�$��,~�*���P�~,��H���h.8�Ld\����?p����c��9�g��|3��1���x�7M���г0ا��o�s�ȴW�6��N|���iQ<���|z�]�J�=�/��~�����`&c=�^�T�<N��l��Y���5P�DF��r~���?9_�@�e�0a��	��'�4�;��t|a�-��M�0�/哒�K��I����{����i�_��?��B�6�
�c.p����ܬ �iL��c̡�5y����Q'���1 ����x�W�h (��ECy�[N�O���d'���z>/.lhݼ��}�Xk��� <����9̣V�у�vW̪�o��;��]^H�p�V�Z9���J�\��}���jk2��[2�Uq�,\��ם�QK�fD;�oփ�wy����D���M�+:�ߦ��!BN<Q����,/��\fd���T�MOx�و�I���u���8{�[4V�'�g>6�8׌�C��ϻ1օ<c�T�4�b�: ?y짟}��ucy`s��~�jU��k��e9�	��|��
H#���gJkr%��'Y�Ev�j��8L�-yݫ��Z�<������o�P����b~���f�t.�o~X2S���ӫ���\3}���_6F>1%�p*�f0aʑh4=��	K```h�Q,w	y�u���-��qᣝ<�3"@ɇ4��a'I�!FKG&��}6���J�q��N�C@j.�4���H���\U�Ձ������깳��k��&U^[���JC�K�P��Kw�x0n�a��[�ڢ���*T.���c�.j��4�%����%�0!ݜ��!M}d7��&��Ut��q&�\{|�����+�6c�r<Lh���w��u4��}׍��kZ=��͕ǰ!�/0)^\np!(�@ ���)��
��f̈́e�C|�x���e�4`���3@h^�lR��D�b櫤?�w �j0��<3_��6bs�{(9~����2����E��=��R�T��'��#��)�y���ִ]����5t�4�O6��u��P�B\X�p^�3Hc� ��O���](���翟��_���      �      x���Y�&;$���*z�&4��r�����P�Ǭꥲ���� ��-�_��Q���	����[��?j�ߞ�+���O�?
�bP+����G��_�_����$�#:����4��^��4�~�x,)?ʁ~5��S�2O	�nq/�?J�~%������.Qy�XʿX���3����g�:�n}~����O~���J���������B��zޟ!w����'�7c	�wc�ō�"���}�?�w���=&�Kv����x(�F�����W�1d�����\��h-�`_���Kx�c)�\��8��]?��j�Du���Lr�i����^<&��Χ��`	�>�����.��?4�H�_a�r�"K�L�
9�j����~��p|�W���4w&Ze��I:>&b�+��(�ϫ=�B9���������X�;U�5��,��fҹߙ���=������Ɍ�cԙᗢP ��ez9�tlMd{��V��j��d�1�/2�O�7���H�L>^�S[�D�ϷXr<�,ؘ�r�����hI�f� �X���:��}6��)�kr���,�dk��̻�h�ݢs����2n����qnؓ���'�q�Eh� h[�>�.��6�eL��&��YL1YU��9�F�87a��$����)�'�51�����a�+�^������+4u̟�V�����# y��1�&{���RDo��{��
�`���Eۅ'���S��?��]x2� ������_]��sM��Ɵ�J����������бÝf����̲������m�ŴJ<��?�f����ײ��s�	���i9����k��/l��M���s�i���!#k'B�"��.(�T�3��>	59������3��6�ŏ�j@�Kʯ� �����|�)��ε���f��|xO�e�AMZ���=#-4	q@��w�nY�@�}����^hUŎ�����y����7�;���2E�Y��~���Y>e[��0�aT�Fe#�qjm��j��/|8�hlf�t8ݾYTF��7yH�|�!��=�ڰ+c��iM���"ᬎ4���֬��19_3T�R��aGm�o@�S@A��['H&E����m�ozv�/1�u�}F�?7��{84tQ�b.ܨ*hx;K�k��Q�*n��Yiʘ^����������������M ���%L�1l�Mi��>%
6��O�c�ճl{6~p���� ��b�Q �������U'δ��޶��^�O�u�l��ґ��לg�S��Q �l�"a:��D���6�.R���
F	o�i o4��2N�:��ӱ	�q�ژ SַJk��9��y��W�\��G��,e��埋�:�xX)�)�
�ȹR��X�s�� 8̡+��竰>���qрC�#��i�?.V o8y��e~J)[s���N���v�6Z2sɠ>�����wk�^w~L�șVb� ��a�J�ei@r�F�(81�<��5��O�Κ�k�8��8h�+�L��R�V�l�y`�.=X�!�~N����������"�!J�K�|�6�	�:��%X��״�{˼�q,�S�ѽs��dɼ�P
G��ll�ɪ�*,�mq.VJI�}��ݩ�l�삮���l?�4S��ۀ�s`�N�Zz"�����F4�{�D�d!Nc��G��T�ה���׶G�ߛ�"Ί���|���%��}�M�Qx�]�Iq���f��E�`_�g�37���5h;�H�	;b��M�D�'�4�C�,�{�e�^�� �9���@伻@c�꜐v���vuFH��7Q_��B��3�^��f$1-�]�L��/Z(�=Q��:��!��v��V��,1r��g�.i�v�!$Ps\;hj� �!��O�I���?�*���+ϓt����5(aa���:ӥ�J��"�i�-��
�8Ni�F�ϐ�# �,$�5��,y?����;�y�-�'��d�ȳ6
b�%�8�g��g5�͑�6��ؽ���[�bg/�v�[f��A���'��[��ƺ�8yNa,���Cm�|������|1Ie0$�,�%���Vn�r@2����tS�
^��:T��]PL�ǋ�[��G�zk���M��K�}�Ҵ!΃�oӲ�����L`��"j�.�vB$0"ok+rXB�S���q��F8��#|�m,II/(XV=��u�r
NA^V��m�����J�]����tq��%fѻ�	C�L� ����7��t�^4�&��M���8L[Sj�"f4��*u% ]�v_�������R�Y���ca�έŹ��\'�}���y=��R"�۳89}`k�?��v���z�_���<J��G�95�m�@t��������|�!�x����T_1.:2a{���h�M�J_>�de��j�{�lȉ�<�P\`q���9��h]+�}��������Vw��%��H����^�=^͉�Ba)T�XV<q�����ꯡb�t��S�%�9퍀hԭ
��:�ƘP����28�؊�^YO���^�ʀ�kxz9'��w^p*C�� (��)jrXFg]@y���!�Р)�$��/F}������
��Zp�dno6wz�^^��@@��%��d]����"#���[b� H���f#�"�؇ſ^Z#>���^+�
���

���^a�m��#>���,�:ʖ��"�猏_��&��L%�TB��λ4Gê�&#���N �]N��*�1�x�c��"R>8�3�� '��B�;�ɡ��D��	��<HA�ϣ׮vA��sG�>�a�ct�8@H�T�=�m�5H�q�-���"��w���a�GN$�Y�߁3�|N�@���|ɞ��&��u�<ɐ-�#s�@���c��4�E6v5��?7��I��l�fWD�)B�E�j��'_��(Kv&�D�ٔ�����)n�2>���9��a&�Ău��.�x���X��K�_�mXB6) S��|��������5�d?ȲNP�*g�_FI���ܱ:B��";����KeA�)�G�:��������̦,m�{���@�D�����������ÆR�i�1��L��%m��l���g��;���M<vD�$0��x�YĪ�j�}�|f=̚�r�����fe���(��N嚠}�5��#~���'�v��|����������*H�G���5iz'`G�%� �#V8^�ʀ���Vn����Pm;,�;:�#,��Sp�^b8t1�*��I<x��K^S��Y*-�z�ǊJ�^��"���(2��c!��Nkav�U�MB~㋷�r!z��8Jz$��<��01��a@�������g����}G�lW�Qݜ���*�r[D�" t����X��뎺�z�������!샭*�K�i1(Ҳ9���[�]!��#�?����Ne��V :T�~X�,��/�*O@РT�ccOCr����
�Q��<�P.$Q23�K�=nf��d��Ag�6��s#��q�ԥ�~��V���������s�,/Nd!Z��-A ���6�Zm���ytX����(j�9� M����j�Wc2���X׊H��"H�z�(���6	�SI ����1^�	����>���|�>�����H����	����|���v��	Ȗ�X�B.��:jD�= nl�et��.BM
1z�Lk/nc}8jy��S�e<�ͺ����8�ǅ$�VVb�oS��G�}�ż6#�/Sy��wiXl�-i;B�dc�dy�EXQ��-(�,�RT0�~�-��_��^c��io|KD&l8�v��M�Ԓ�9��x,d2�m�U?ړ&Z���(��B�ȼ��&}X;��6�v�-�4J�]4�}L�d@��lu�6�/Z��7��6��t��n�$%��Bs� �jFK E��8��cש}�k����ؕT������Q�l���������Z��w��	i,�8���P�Sp&��h��J�4Jz#J_��	}<\N�1:���Np6�|�mb��$�w�w��:��u�ըd��8�N��ȇ����N�#*�u�,] {�    I�#���[�RI�k��]R/�hr(��UPT�|B
��� Ou���$�{����������E4f�rf�LSeD���ȇ\�B6x/��]��-����w(��E�����f�X6a��gJ�7z���"����Gh�4��]�������M�����%�I7Y���p�6B�X�tY�?p�����q���'e� �ۧq����*��Y��~�qȝ�����|�1񵧗�K?�Igj=;l\�L�LФ���n�ǖ�� �Q�Z_Ko�쏵aO�1��iј.�B��_'��8J�y��&��ͦ�(��@�����
ڧ�Iuqf�d��۠�ft�<��P)r!fi=�� �)�0p�젳q��U؍|&�,?�N�h��	�4�)�� �=�*�!Z��q6ܹ�x[)x�Հ/&���,�,E�E��B����.:��y� �Q��k����a�X}�
�ϝϦ���,T��@�{ug]p�n�u�d;h�z��+oT�3��yP{)?Dۯ��.И����.!�:�IJ����9'�D|R�A��å�6��  !��H,���Ȭ;ЁF� ���zK��Ħ�k����Z	Sο�j��<D����ܤ=Z�i���MXM�+�P�F�vp�n5��A>�C��*m\�:��d�'k���̦���Q�͇K�K%��a�[Y�⹱fJ ��q��i�}�I�Fv�u�Wq��l���(���*�u��Xԃ�JB�.�&��X1�w�H�+W���� �$�Ԕw3���e�$@�����«N��
`��[[;F��IR/�^h�q����yА=@�Xɗ�%[�@�B�؉���Ә�k0k&�[7��F�ƚ^ا�.6��6?�EYhi��Z��������}�0��BèM����������3-�1�$�������{ ��;J@lĴ�	^�K��9	M��6t��ئU,�T���]��Ȋ.ǡz)�H�&��>(��'�j�u�|P���F�#e+�.��8#����qn~J�=����:v��uv@�9Gk:��'����5��b����i+f�2����i[�%��=!���m�)�NW�ĭ�NKM ș� �f�Xn����%������9�>��f�G
B�;���
��l��m�<�vh�Ы������(	���ě_[�=M��u򚘗�{��̃����B/S^�Q���O�M�?�m���c�צ�!A#�̒���x��*] C<�sܓk{����u�r$7Z�y" 5��)���X2�\xQ}��D�$e��������ɞ��N�����-|�����3.C���� ��`�t���8�6�ڀM����G1��胳@!��a��N���(	G:MXʷҼy�z�gV5��%j�/*��UvH(�0���m:��u5��A�~ (�i��Ok�<]�go�R?�íЪ�m��G��E�j��%>b��s�I�9����k� [ �����?s�ש���5"��&t���� ���9��u%�笉�����+rlUM<�l����MD;Ro��}d��Y�����2��1h�V/US�${X5]�����{sn���"5
���7���&$[�ɘ�X�=��6�I�C\���{ �i�e�V��5;�9~�yʈ|�٬sc�X�4/���꥾���n�&>2�=��Ӫ}�"EY���A�h^�
�������8)�97"\�&\����~L�q�Ӄ#�vp��1O�ex�(����M2ti=�1�2e"�j�����dk��+��Wn�r*�F����͝W� �'��-o��By��]�[���*3W4K/5����sog�OF�*>yZT7���:,c��t�`����T�<͂��ܰ���M���r����5�,CR��J�d8�N̂7�P���_W2,֔������H�@4��[>]������q^o�rÿ�T�>��'z)�:Q��HfCϾq��+�F��u��i2EF_X:��%ZP�x�@D��_�&�	c��h�}bd�0���RI��5z�-������ l��w�IM��ئ�˥���� ����5��6�̊��@��|]��<X���"8+���6I��h����E!���;�N/�� 6��%!?�j%�h��f� dy%5R��|�|����/��?^qt��d��X礖�PTX_1��ͩ��24��j%����0�.0t�,`cBL;�jݚ&TV# �9cʇ
����oj��7����vPÓ�7����.	��PDh	�z%��Ff���X� ���쐌&j �iu'�tHu]�}ԏ���9��6+��+<�^��0�s2t� m{����t�͏��K���2�'|+���BD_�%}K>�;th�FZӷ��d���Vg�3_Hs�R�0�m���.$˞�A��քxw�A43���@Eʓ���GN����t��c?��U�p���"��-z��_���&
�r��}B��@dv���;z=�K�2��Cy�q�)@���V��1 �6�A�n�5���.9����.`D�q��oy�«
e1��hiG��jD0�7�z�9-m��H�ݓP47���6$7Z�^�uڽ{�@�� ��@>����KM�4��F��i���p�s���4r�X�nQL4���N��ClO�>���od$��/��&:K�y�E�����.�9����\���6�օ�V/ď���sq�g�V���6��+�l�#�	:��P�|iU��K������o�s��P׉T��53<�u0������"�"��P�#ڣa�,���G�7��t���:p2��ۋ��b8��J�H�/M�0���KZ��¤�^�tG��_:��!܈.�t$�~\���Kn�A�V���:'R����5_��CL/"�7��3w}-G��A{c����"p�4-���9z��5~J�+������o��o�
6�{�O�[]�q��8��m�4��9��>}���P7��Cn#�ԃ�GQ�m�ݘ(3" ӷq^g����lX舧(�ky��G��,�h�������ɼ���Noc���kk���!}����ֻv�;p��T����5zAI��!{�m,�~�>G�n����gH���o1�V�}e�,`��Fo���w���z�B����\dv#����4�I�W����F?��,��!zt��pA��g���w%�S�|Ƶ̓�z�h��WܭI��5]��]��#�4� ldD�U[^�::C��V�X�Q��BH�aj?dp�}�[V���Ai�R�Z��`�/�q�Gk6-��$\��݆��5E:[j?���T2�2/-�m�n$EuX����K�h��p�F]���a6U@&�>��%�R}� �h�n���"�9��@��UWdj#���6(76>9� j#�Eut7�G��PKچ����e���]�u�
�ê�!�� �N㸬���V�P�ި��Un��Vt��g�=�ŏV�fjaE�28�ՠ�6b�=�a����1l
�N	���?��`/� ^&������M���x�Xvt���k�� ���ءdd �k���,�r�.p�����/����iC�HK�<]JÍp����u���T�����̻�Ʈ#�FCMe��������%V%�u�;k� Ȕ���^�W�sXk��=h}���jp;2�Uˏ��Ĺ�v�!Z�
�TTCL(�4L,���SM)iݶK߮�.cz�6�MZj]��vA��w�k(+��wy�UK�#2�>�n��GP���`cț��<��n���i89�9g~��2��H�ߟ72F�_*�CivS�kW�AP/'`#M��m�T�  
�2�0����d3�����t��6���M1����72���������5�cF7H\�ݜk{���vE�4��6~�rj]�MӴ�����6�IlǄO�ҾK�5���i��%�lgV�"$^��"���g�F�As�oG]�TK���.��i��\3�d[�\A��٨B].s�E�7��34PD��p#��AT��
�5�I�N�D�?�N�� tt�"�<�^v2��9��s�� �rz��Sm�z�Y&wO��u����~KW{� T  6�=�[YE}���֙�:&N�ej�6UHm��v�o�����m��{����|��6��2AP]���}�̥�{!�#}�्�_���|nd����\I6ٯ�G]&��S07N�(7�F!��9>�R ���4ɛ�e��x@%F:�>���:��H���#�/� �&�T�'`c;2��E��%�\Q��'�S�T+���G�8�����K���K�nia��������Or����wz$K��w@��9���f;	�`��%���d�^��q祟覇a��@�y��n�b�=U��D`���hncs�즚AtmǕ]��u}�oͳ���3݌K�E1�I�R���D*�l1�-򚥝���# 1��@M�C���B�1��
�1��$p�e��w���r�+c1���yl���ہ��[L��-�J35&��#���y�W���m,��=b�̟Y.�M^�%}�$h�52ߧ����S:���P��#�}B9
SY�.z�Y��s��3��N��0�tNbR���]}[����8f;��
WȠ_�5=�i^��l�!]�u]�ᆎ��v�r��r������=�H��9���m�k�K�(�uُ̪:�vjNAҚ��m�pd��q=���e3�A7.c����%�H�J�;�Tμ	��{l�s^��r�JL7���D�U� ��e�V�������gG 2mR�ؒ����."1�qD�Q��ݵ�k1�
h6�25u��}�N�+x��֑����M:��#z�6$�g~'+�k�U�O>�W+W4U�1��_�8�G�s��;()~f��[��"���� M_S��1OriP�L5?�Y�dU#��m���& �|j���6\��½�U�޼|���f`���0>�Զ��6�F}Q�ࣱ��_��O�%#wӼN#�v��I�p	���j�r�j��t����Fq�٣.U����.�l� ������y����Bu�6�=��vS�7۸���.lz|�d @lq�g^"��F=P�JW5r��gkg�4�*WŠJ����n]��J[�\d���Lu� hp�7��hl�h/�>-ZN�p5>�Tj�j�����
���U1	������s/�v�4���b��4=�=z����<���d)      �   �  x�}��m!�Ϧ�m�h���sΩ R���(J�4���A�X�5Xl�|����x�v�������������?����ߧ��iZ��cb��h�D��~�5�4k8YS,8��x�j��68h��\pFp��3yk
c��\pVp����`�x�\�f��}ܜ��v�KD�\pNp��s�`��񚸬)/8��y�Y�WA����BrO���O�����m���UW��ҷ�_���0-�'f� Gb WϚof��	E� �4�m��2P��@�|�%d��i�n�z�J���CbV@A0�4�p�s QEpu��1�l;I0�>��۱��SI�Mr��6!���(��xI�6�5���qyf�)<0��Z��&�˃R�=#��      �      x��]i��:n����@9�K�Y|�s�	�Xٞ�7=��K"�_.�WK��T�_z���_����WJ�C��g�/���]������|��9��������������㏕�np��n������/��W������2~���o������_�fp�>d5x�5?���ܐ��<g��a�X�޿6?ں������Jrc��+C�>��k��g�Nϡ�8TO���:7*�����D���9c�28�����'CK�7��|z�s��thfi��8�r15�v�9zX���;0���og-�W�S4�/��B�:/�������x�g��]e����wm�]�S8�=[�����-~�K��=h��+������l�,����-�,+X��"\�n�=���n�fUR��4���X��|HS6��LF���y=ީ��q�����&�5���>�}���?���=7��d9ν�S&������,��{��RX�ֺ��|�ͷ�"{�ohJ�69��
R���{�_eQ����>���݌V�z�t���|�)^%��=�)�w�C��3�0{�G?�<����ǝ�'ͫ�J�Vl�t��]����m��o�Y�U�՚��ߙ7m�=R�)Hy����~�v�6n��8���O�S5����E��=/Z�\u
���j��2�[����)j��+]4oP��֩Ϧ%h����K$�5
���U�*��Z�4֦���%�z���`m�M�G?�~���zezy��Ђ�}�Wo�\ uC�;G��`��]���q��O�S6����e��`�Ḵ*�[�̾H��i؂�y�oC��m�;پugo�
	��+:-�}�3�Ns�!]5��5�|C�)�����w�J�v��t���e[��ܺi����*w�����\sƃ,�K�����2�{�9�g�6#���ٽ��V�6/G{�ˣt�'��j/�\}���N�J�����O#�#Ճ�+�2O:ϙ�$R��=��|�[qM�����xe板���a�v��a�O�g��z���WZR�GO�6�Y��oז�.QX���f�)[���X�T��Ƭ]�!���"�%�����~ou��@�-���MeR����|0ᜥ?m.;��9�e'rN�j�^�5����C��[6(ly3�S�����v�[���c��]h��nr��3a�[�e{�qO��"C�����Oi ܜ��&Q�n��Z��P`����h�`�������!]�}>�ح/�5f�}�U��ţP���Z ������!�&�#�$�e�G�_/��W.qp����iE!�
P��}gh/�Z].xvS��ؗky�f>� �P�U]�W\��Kؘ���6���	9����V{
��L#��JK7E��]�P����x���֠J�Q��\�\q����֚ ��Ь��k���$[+�z����<�LE*8��]��ez�S��MI���~���8�I�pu�6���fo^/�� ����r�]��T	M�}������hW���*7K�V�$p�?����rw���R�D��3�l�r+YLo�V�S�E>��)ʯ�7�)b��}�C��D��vM�[8)oؖB���ר�睑j�P�%t[���.�W�Nk��ⓖ*b��6zt*�6�j���e)n?�:�/�Θ.N�]���^����u�Q���8�n�L}7��B�M#�$7�.K��1q�4wmn\�
��I��g;�}�m0��eŉx� L���E�N���
B�2{��Q��I���͕#���N���ޖ뎪�H�
���P�*A���t�p�8y���>�@������9����P^g�y��a�z�n��w=	�Q��"�S �a,�|�8ݱ�Fk��4��b�a��0\�SO���-1���x����� ��"Cq���,I0_��s^��$j�x�`����@u�s{����N�a����<�<OY^�����\�9�m����K��p�^�sA9�ڧо�qMˇx��@@�����v!޶b�c�}N^+���R`m���nU���?va����h��,��S�m�6�۫>	WF�,9��q�/����L����3���u�F�yes�>s��bsj�ŕ�ͬӞ7N[����b�5�%��ՊM�,4�.Y#{!�ҁ?�j�^�ɓ��8O�2 ���{Q�>�_�FP&K|�+��*��k��[F`斞����h�.ZR�0c.�5�-�U�K� ��>$�s��R+
9�Q��Nz��5uW�w՗���ʭ2��`.b^>)��e�s���%_�e&&��K_ȉAWq���w=�E�s�dsV�A<��u���ٴPY�����3%u�^��J>-�L��>�j�j��ӃX���hz��d�*�
R��3�	كyp}��%�X��HE�B7�n㡸�j"�������Ztږ}��Y5k�I�,�k�Oh)��[��tfې_�%�~��t�R�:��H��M�M�p�|m(%�TU\� K���#.�N�y� �4�kZ÷x�&{�0l=���>��vwٚ7�Ѿ����t�2)0�v��|����/��9�t@�M�����xsɤ�<��'�oV��=���H��7W�B��X��C�u�6�m�i�4#�E��*��� ��}}:��9�؊v�����0�cZ�<���Ab~xuç��I���i�2s�t�H ����*�-�l
�^���Ebd>oO<�H�۹�Zg���Jd�OռKc�ANEޮ0��}9��ƾ�-G殨$����G�3�:]�Yoɳ���Q�c��di�����xܾ%��?�]=:E�-�c���=��U@p�w��BY9�D�n�ֱ�����!���(́�G_���P����f��	���;�@!�{�M�\�����eH�e��԰Ou��ՒD^ArD�7V<� ��u�d����-3�������Fd�^U������T�fm��Gip��w�S��?� ����Az��1?���~�[2�:t<`��C�B���fu����O?��ك�;&	`�Y1*�ry!#� X���V����#�T���ç�@g-%)H�5~�_{ѧ5:(����H�1��������уMK�`:H4?˪���HlG��+@���ufedF5	��E5�o�br�vm��{(7��,;�x����]�����~#A��m|������(�&����V��8<j��-��Cy�����[st�sW�=������Lc�Q�r@D��t��A��Ldv�փ~Ǣ�	�f٥z`}�;��<�f}��CQZ|R�D8p��_��V�X��E�*Z�"�]�.)��>��wY�ák�-X轤�=�n����fx!&l���Q~mݣ�Wdn����6�YR#*�!n8X�%�f�f�:G�*��<�J�e+S�B�kH�S�� E�q�4���A��30\��1��$��(�gEu��Of�����[B��e���z���M������w!Z��t�@�A�׮��_J������>�Gw��ځ`	��c�!A[��d��Ӯ��gp�<���<7����-3*��F���V)U6�ߪ2?I"�̃c��¡ü����{�ޭCS`���ק�?�,J��.����.I x���ʜ���&�D:B�fV3�f"�W[���Sl �}n٭T���㱇6��w ���a�V֮��m�X4�MY�+�R�*��^���9�2��=�94V�ސb(mo(�3�s����ĥ�K%��g��
xh(y}O�)��|Jn�ڞ�#ɋ��n+s���{Qw�捋�E	�t�۴�M����`�:��]��^�$^��H�Z�W^�n�r�2%�}�X�h-��e�$��h��j�c����U�d�� ��xV�#�q�/lY+�]�cS,��ќ�C�nY���J����%e�Cٸ��~u@�U�	�/pсr�AA[�+u���(�|PS�.F�pXU�.�e�,�{�����]V-��z�"FE��<�砦�?�P/2V̺u��6ELΒA@�C�]U��TE���r��>K�cG���M�v_�����9O:<��9W�r�)0uO>�@�#c]�<,�{��'�=���b����N(�    �Q#6ض��r���(W��+1��+~A�"�$6��6ZRe���Y#k�n�O{�ʁ\�\Hr!��Qȡrě�i�����㫊�HJ���#�Z���;�r)Ea-}"8Fe��WQR:3D�ɚ����W��!�X|ƫ��5�CPE�jB�ѧ�p����������Ⱦ|���2�A�49�u �*�̪22 -�����kƯ9��,���,݊��vn+�o>~S�Q+q߃�W�}�����2��D��^/���ԱME~*_
9)����7�i���-����!�]U��x���ѳH���?�h�~���5S�*l`w4���TxF�P!XUUFW����;�
�����yzn��9)���DM/��O�:���+θ��š��1մ�*����~";��d��E)�ڑ���(c�UʌKJ���0�So�?a��	R窇O�` �V��S��a�ϒ�W."~Q�lP�G��o��o��?3��O���*N9���ҡ����o(ܲ�X��m����Y^)]����r���*�INW gw�X�����.�����P/~�W�o`/ �/�LB(�i
���;��y˪.墑�'����_���H[��~"7�u�)/�
�	e�v��	�p��B7����ڈE>�-5 � 5�U��,z!Rߜ�A>�<Ė�Sr�5�xA��5ŏT���X�����@� ��C��~ŕ-۴v��K��L ���q���[�6w�!�w��ɋ��pGu������%'qٱ/NN��R������ɼç�f��a��^�enBު��R)1��B�"��d�QT D�����u��S�;5��m�[Eͻr�>8�۷����P!�R���v+r(9�Dؘndne߳`i(��*g'mw��7Y�9�P��l��ѱx�I,�����U�D?����7��F�"�;|z�VTs�W%�y������h��)�hO=�+������X
�=�W�E&��4��$
���\���wz��o�����H�)���^��B��*�� ��C� �@J}*�@�S�����4�ic�bf�,ª-��A9U7+Xő׬ϭ|=6�Ċ\$�<����A��N�5+r�A�l�Pq^� U��7>]r4�9���YS���C�GZ�臚��G�5��yS��6*���8&D���[���jzVp
$h���A�
"����;������AU0��9\6w[���u��� �-z#��km�	�r'� >���*r�S[��I,pOL���29�i�
����C���S 8V��eX2�����9��������E��6QC#k�WU���c1�4�*�I�֚|�{�V=H9�C���H1�+]�8�U�����cy��کH�7�EPXv\�c�z(ݨ�T�b������6�}�0�����8G�*��z���Qh�U�zGu��JW��_�F��k�X��E��B�:AkƬ�-Ӧ3�;��:|���Q>��Q\EV��%�J��-��p�)\v�*r�tL���Ǟz�؇^��$�˟������@HpS}]���h��Y}=�S�z�����ٷbV~FWtd�hۜ�ʇ�U�;/U�]nҐ$"Rgv~�s����!�-8�5�'pY�WC�.	��S�Z% ��������@�Ʊ�f	��R����pԣ�Ud������:���Zd���L)��e���2�1��s�1��1xR�f�BU"[�	�mL8V���RT"*3�?V�YV1�b�b���T�A ��r%n���_��\��W
j
ȞA}�
�%�f�)�"Um�3�>��VU�B[�5{ۧurC��ρa\���CZ@w�asG�&P/|�."�Ђm�˙�?�ʷU��z��n`�p��(��yO6�~Sw�Z$~Q`C�,����Iω���ѩ�ġc7���S] �C� Gw$i��3����𸅣��$lI�N��i&A���%�����&�~@��_S�&�·S�ɏ:���E�%��}�Y *rm-)�B�p�d������Y�Di�E��:�n�Z��s��TN����-�,e0��5�ߋ ����Xl_t(�S?kӾ5m�.�G�}N�Eo��5t�wT��Qd�U3�>�L�z=p�% �U�_�f���yDY��@�
B@C#��$1�)ge�8�К*�P��pW��l�ըt]yS*�wf�Z0�q)�7v	!s ��5n���ѩ�U�4�9z�\�>���r���K�6ޑ�z�%��c��&��PY(=.��Cǂ�mS�
uȷXe����l̼� �
R�׉�l
#��FT�x�@;��ٷ@R�Pn�j9�}���-�U��YH!�h���aP!�
z�	�*Qe�p�m�U5�C��eh9��������*�U�M6�����:M���9�����2J�ud߿��e����l_De@���s(Vh�L�G�(9K����6���Ha$7�·���Nը�@�
Ϋ>H~p2Sԁ)3c�����b`f=�� ��x{;��W��~\�	`���:���@Ⱦ��}E�(��"��4��xQ��*�z_�pے���R��PD��OU^�`M��{~��4��p��b�a�v��&����,�6�4��(��o�k�e=gTLS�VK=mD�}Iʅ����=��:��Z�����ոz�fǮ4�p84�f�Y��<4kX���P~�/�e��K����K�R�04�D���~u��Y�&�PNP|����G#���-�C=���^��I��*Q=3h��������0W�R~��bC#����+�[�KM�;�������t�r��y̛�9�^	���Դ��W�I �|bO<I��b�/(@��A�Z���|�,�jy��%a�,�x<�7G����W��EC���J_L�A�m�/������U˶>z�@�"W��������5J�/Y%����`۠��G���ũ�Y�j�
P�&��k��~��h�8D�����6k����eTU����nޑ@
��j��œ�/��@�{{Ĭ�?u�9����~��T(ʎYC��`2Ǖ�x�h��Kh���g�\�'�1��9���S����g6�	��C3X�jS�[6oԐ~ �[?�!�3�F@$N-�?�+X�K��[�}ߩԹ�7'�=�>9���#Qu����;���Xw=П$�΅�>� ��g��׳T�bb��f�&�	�@A��Q�S���#Im<X|�zd�+/���̽L	|�M�����+U9E.kh���>�����1vlv�釦����Q�%���NBQ�����g-�����E�g#�����z~IO��S�?�v�o\J\��f ������#84�k�W�mA���Q��F)c�*�M)�?�b�Z(]���Dr�3�#0��s�f��ɇv���J��n`x�a)�pS�>v�9`�:����QG����U�b�
]���ݕ���M�jX'���D�r肚�G��_��7�J� �BV|�F��[�0�a����*��+��ܻʊi��'%c��y�x�a:���/��:@���?ުC�0�AIW��cl�`9��C�@f/N��q�΢�8�����"��b�q+ ���C����/T��c�r�0?�>��k5�+R��\�S�+;P�B�#\%���bS��Q����w����Pgd�-� ��������x��?��FR޷09b�f��Ba����/�/νHE��#�RS����R�Ph~ b�ke{�&�4��鵚ox�R�v2+/u���S��P�j� j(�T.SW��h{B��G�9�zE���[��3ft�Ne�{��K>�iy��u��R��
'����m�Mr�|�֕?<M��,"���nޤ�(����KȓUb$Xg�D�j������)�������xx�CS\���U�Fmz�a����Q��m��l!-����tA�hz�;��Q :�'T���󱙩���G���n�bX�q������9��9 睞�N���
����ߟ��1��W$I�O�(�gj�}�Y7��K	m�j����j�G�%J�H{M��n�������#���? �
  ��Qޠ�sx�D{�v!p[��u��Д��+����
��h*�κV���v:dB%#u@���9��j�2��P8$���b��ˁ�3����c�$�v2��>��[ss�z��4��/�z�����vz�æ{�Ge�x��W�Z�m5�Q���(]�kn�����O���-z��M��):��7�����;Е�JM]}I��{��O��iMpޫ��[W$FB���`h�.���C�����8x_\ۤ�Wa벧��i��h�&h�O2-sW푹e(�4����,�)Յ6$-k�� �J�ӑ�ũ�+9$���;�xb��g}[���)�Z�W���=gɺJ���,I�� Am�-�Y,�aق'
�g;T�]K��5��<2pe��&��R�ޠκ���*������uU(Ghs��pu�?"5)K��P�j�:����6�Y��Ԁ�]�8Wh���f�hA
b+���b��f�a��G�d=F���N������[]�pHk'3|г�
�+:�u8t-��r���G�c�Y=��H�<c�΄>���[�6�B)����6��Uߣ�o19�K��R�����C	���X�@�6ѩ�.�F�����\��;�vt[@*ǫU��Uo[BU�����z>�V�ܵ��Qi�ã����ʥ�Z]���%�P}�#���U|�t�8	�'s��(x�@CYŽ:�?U��$.�6M[O������G����.��AҎ�:#s�z%�(���\��+�}PUW��4�S�Qr ���*��$̀Xj�$`��Ru����|i`}p�S5b�J=(��A]��=�!q[���r= g&Wl^����Ul5��\�F�S������\=<<����^����]�_�� $���V��ԥA��?�;` �{kT�W_�y5OR�v�?����.�:JOz���1�tO�wj�T�Ъ>�=�����������b=�0.����Z�Dhvf�Dt<Tٺz(f���+��ܻ�6Iډ�v�L�IV�A���+�c�!���%���Fo�v�P��V���Q�"�Wǝ(<.l~�=20�8c����u����4U�g�lp�<�~��� ��=�|0�Z�a�Q>��&��E��v&�
́���9Ǚc{�C��Ě|�� 2���F߲��/�V��6��)y��<>��M�t���n�J��	7��@�ٶX���T����h��ez�N���(y�=���<��v5��A��{�L��t�$t=|�Fi*��\c蔐}�2��"c��y���px6�g���ˣ��\1g� ��|�z�����;����h�\������Wb��t_���)�jG���1�P���2\��/3yf<�(`�@�E�v��d��Fa���&��@�s^	ڋ��"P��o4����Ɋ��݂C��uʁ^�Yκ(�B�n���'�<eũ���6~j��t"�+�ru%	�@��䎭��U�mT� ޜt@=%��x!D��R�#	V��m��
�7)T�_ k��=�w�<�Wbn�V>�톡JBRu�6�vc����$h�0��;�7���W�~/��"tp�G�H�;��J����� �Vwn(,,��Rxzu�l]��=׵y��m`~�G�G�T�-�)s��~5y��&���[�R~j\��hơ(H�/k�[u�|/����+J��d �2}�PoéZ�|�-��i�>�X�_�TeZѥYi�iЁi�P�L������Q�|��J/E���ؚH���T��$Kc�T�p�>�U+�Z�2O���z��t�l��I��ؑ��)"����7)��90�iF7�G�r7�\0/��j��p?���M{���2Jܪ�)9���t�g�	�� �"GF�6/���0���Xp)���^��Y�'�`�$ �%��|(�?�3�ҿ��7���#jZCv�2�1�"5<^X��l/�g��^'mƣ�� .dwD{�����=ȵ���J�^�ײ>�}g�+P��Ccn����)'rWr�[,�m/��/��m��!d�Y��]8��0}_Mg�=�z���8��h��l�+�{#=/�E�	u���^����,��žI���h���cើ1����$���lq>hZ�q3�F�
�`r�}�O�ě]�A���GrK�'�a�� { �#���K��1�ᇛ^7�C���1b���*{֏�75��
��O3ks.}_O�`�v'r����u�z��5.(�.���V	����j�9����Zy������`�U�U�L���І��PO��ꜫ8�L>ts����w�׸�y�S�ēN/��x֕;���g��<#��{m�#�a+g\�YU����V���;�Ԭ�ɽ^��{�\��O���~�h�$]E��3:�^2_V�/�j�F����n�2D���"��]ۘ��t�
��-��r Q�w�2/��3&�m��xP,^��K�w�d�F�p�>�w��j�E��M>u��%�>��kM��x�H�9�}]a��@ÁH��1�&_uo#�/NC?rx���j��Ts�9�|�͉��Š�	l=B�j������u45|T)j�v.!V����L}�U�+���ⱄ�A����U$�_b��}�� \GB�p�z�
X+We��Ħ��R�U'#"⓺� sPR?N[�Cy�����齊�9F�G����������g\      �      x��}Y�$���w�*z�5������G��E#��8(d���5p0M��s}�S����M����q�OJ������i��g��Ƀ���/����e��i���C?�}�o����#���SǿO��Q���>����пT�'�Yҟ}���y*e�g�g��=O�_����{�<���8���P�Y7O�R���-/��S������¿i�[s�姶8M8�?m��;���F_�ȏ��_�f?�I~��k?;��`��V?E�v�����;��SE��z{?���[�3��0�|�OsL26ٱ$��������������3|n��ŏ��m���|9L4�����su[����?�E�ե3�2A�Y>��7%�μ�h����yi���o�f'k}�H<����� m� o͇�����(��nK��kx�L��rv��-�v��J9h���dc�t�詊cͪyWU��<�}NC�Gi��x���~ڢ�Τ�[�
��;�ƌ�?K�~cɏ�&�$OM/�5�glٻ2_L�l�����yǎ�)4��e�&������h��/>J��ge�;1���S��,���M�зJ�H�c���6;�<��|�����3�sɟ��Y`���O�[$�9�\v��P�m�����T�▱^������y��T�6��|$U}���9�5�Y�|���=�己���������|]C�������X����w3��ؽ��ϯ�{�g�r�;&�q��ǚ��V>�}���L�{��G3D9�]!0v��ui/��*�J����m3�<W��|�����v����9���l�؞��h�Ʀ=m�����aqБ�f�Y�9D��`U��8lh�{��6���~��p�ϛ��]���+l`��]��#�'����}��~ga��}�;�u4��Ϟ|��9�Yh���;�����&�)+6:�iP�C(;����Y�(���!�]�^Eb¦c�9G	��Ǖ�L����u���Cv �~K�	��}o+��ԏ&H�[)�84��T!|O��4n�}��/~nߟ��I�r�(�����>�1�����]�X%�+L��;�(>Gr�����
�/!L�D���s�+Y�����<̖���"i���a���f��~Ɩ0Y��ξ���*�9��:&��3�L���)���v��d�+��ڎ��+�9l��e_ֳ���w�_sJ�+��+��v��go��`,�B�9�0�����͛��}�gcA�C��y���㓲;�� ���3���������&����s�0�H�8	�B~f��[�8k��-4�_�����8��fv�wC�UL|6x������	��l,\$2���KK��Y���c˱��
����&}���~6�%��wf�=x�{��{���!0��bM�X�lfO��| �,�e����l���{nl�Xbه>����ǎ�B�Ûj̾� -�оf��1�zVz`?�����������	 ��^y-|.𥉉� �q�E.���8I #y���xq���Y{�10L���`y�����d�f��2`3�Y���9���k��!Ĭ�O�x��F�/2�.E�M��S��5=����̈́ӿ��q:�_�uGGԏ0���)�s�#6cO�b������D6<�.N�&���.6]N�2�����AH���۾���f��³��w�:�ӄ�M�M�ݚǧ��b��XA�u�%��α��\�m�3�����k�nb�`���'�#b���J�`>N�B�@�	�2�=8��\�/	����i@����z��D�pv(��l��%�^і�,��͟��U�����8Hj�!N{<E�����[

C�g:+̟M�$�XU��t�۝�x���?P��9���c����xzK:��J5�
{�X`����g|*�������9?�T����m�k&#k�^�R_"�=����8�C��UV�� �e�����VH��L�1�Ҹ-<�Zn�50�-:91B��n�TO�"�1r[�<��7��-ل���*�mA�y��>��F�k�8��J	��܂���攱����xI��MsIr>�9���x�.�����X譏�x�� ����H�'��t1I�"q�SZF�=��^�?SND�:���s�����.{&�l������)B�j��쫴е}��i�*l;�,��ۂ�<�]�&�Xgz(�w����P^z��1�)n�y��:;����3��<���ځ	 �t6T�-,�G5��B�1Rd��ٽk����;b	���?����0��Ǧ~�/�H�c��<�w�G���]T#P��bvآ�r�o��:	%a֞4�O~��,�j�����������
!��ӌX-��
\�flC�:xĥ�߼88�7s��7w�эλD��:;� ���T׉�ؒ���WMh��1�>���ز��c��Zs�7������V�V��%��K��9���t��/uF�G�C�:}ި�\����j��8��N�=f�)1�� �����t�R^�5
���k�p'p�X0���gK�wCW����Ϲ*��A.R��_�'�FV���(=9I`)M�T��!Z7��&и��O�,��ۑU�'#|3o�6��� �%K�`�Hh�����<k�y�0
�P���&�a�=�)X�E����8�
�_	��<tYB�#����c�^�%�:7���+C&%��8������ABy6	y'����5S�-�����8ɨ�CT����\����c'[1���;d��S%/Ră�"�ٞ���!܇�(j�����J����O>G�o���i~t����|�Q½�Vo�V��s
�˸w%񅃱,�	¨$�	K�J ��i����ϗ���'�6�-����2����S@yЯsB����ݓ�.3A�
0����g���T�};<�mX/PH|2�ǝ����M"yՄRqc��e�YP�>��Y�;\p[��s̛;mǒ\��~p}�����O� �%����}�%YmSԁ�*׍3,�&�~�@�KB��lE��~�݀���Wl�.@��^&R�,U���Y%�Re�cC��*0�[XTx���}ճ�H�p?+L��Д�f�dm�k5g�b2 %�LZ�z ��7C9t�b>�ݍ��2g�%D��˝Pݓ9h-'d&0�!O��u8��J�NX��A���GO�A�o��aYL��XTx�~����y0g�Y	��|i\Ȝ�C�� MY[>��^JiX����b:�¯~�K~��ͥ�ﮬ?�Q/���{�G��T���Ή�h��V�dB��� s���Ζda�BԶ��.!��T�,!���Bz�c@W2��[��3:�� -�h�k�!����dY�MX��R�N7~Y8��)V���0�2��(�|�F"?��}ܕyraK4����K@�pGfc;-�f;�Z�.tn��+c
1��-MY
�C��f���MMe���t����ׅ�c�h<x��Np&���m��0�TB�0�T����Z�8�Vߠ���-��� BkT�C|ov7�R[Xr�Ȯ?u@���������f�䂓ȱB�;O(�/����ۣg�by����QÃ�p4��Kǀ��`vV�C����p_>����?4 �'0��>�4�2����.m�Xs�@�b��X��k=�7([��㡗G;bx��[��.�3����o�d���������Y����N,y%.ܣfH��
si�3.��ǚ��\^�Ahg�!��B>$��(/=�-]w�q��x.�2��W7��(�%5�PKh?��Rzy�z�ط=�C
�'(���Ƀ�4d�	��)*f+6*<��Mno=�1%l�4�6>�K�n	�Y��-���*T��{��[��wUtG�P����lxGC6�a���}h��W�7M���q^1Pb�[��l6lJ��7ki2_)Nv�rO�H��&����Ϝ��tx�!�N�MŃ9���T����e��^v3�������fW�����
�>��Ml=XΔ�2@��g�8�.T�����f�>'Б�%��Zz�.r�\�\7�-���0�;�ӄ\�pe��7���(�g���    ��|ySZ���<D�|q9��v��$d����H��v��?+�f�<��H��]����o�R.�]��-$�����:�4L����y`=��dٟ��-���ZWo��.�0e�d�3��ޥ
�n;�2'Cx�԰q�O8��>��R̃�^w!R�e�ɱXZ@5;Ր�<�(+ɒa)�@:a�ɄS���	�jB8Uw�+hqN�C�O�T,�"�u^;�����\�����F��)��L�%�C��:Y�}͏����7Z���e�f�0�=��T�m�ѭӤ��i?*R�^�f��+'j�l����:d���L!l)�B�\�,��BJ6���F��yp]F>�\,�$��w����ʚ�P��@���ɗ�,��/>����I�o=!���.a3��G���Y/��I.?�^E/
Z��+��`^�������p�H,�l>���#NIPr�3y0� �=��|3g����PK��䫲"��J�^e�)I�e8
QI}����`@�%�`]��o��A��2�=��gh9$(�X����5��C�GD��a������ lЁ桪U���PuOΟF�׬N/T����?�#�^b�l�8i� U�)e]��%���R�v��Qg�1�-lu8���at	�N��l��V�S@�!Q�Btt*
<���4����9������wW'����e�� �!SE����Xp��˺y�g�ђ �Q\��+Fi��b2dV��f�8b����$�L�,�Vm�T� ��4���.l�������*���ޙ*���t�0����4�Li>S��6��a�������1,�[�Vj�^�v9U�c��HS:��Y���$�	�5�-����gښyp�Y�����WҀ1�����g��o[���h&�{�j��W�Q����	8��a�Etu(c�I���������*�К�h(����&	F�P�-%��u�BT�洀^�[F�C�'L�}]g������ �c@dp�g��Yn��O${�<�k)�E��I&�y��Η|�h���tħKK���b����~�L��	u� �1������e�Z/�3�F�W�#�`�PKB������1����᭞�X���Dɰ�{��d��j�Y���^�C�6�L�,�BK�E����R=FS��'Q��MEm�]� ��&�4�O��Gr�5�_�@f��WFg���v�%��tB&#4z]��7��XHk.`����} jP����������?�K��NF��pS���B]�#�2�JIC�nE�ɭ�K%��T!�}k�1�
�Rvoؽ�E����,8
� �~�Y9?����O漳b)��z��[��Hi������}W=�[ׯ�k~�`��y%�2�d1�V'��,�R8%��1ؕ�2/0`���#�>0t=M��b{��%�M')+���D5�j6�Bv�҈7N�'�����-A*SF���f+	g&Հ��;R��������q��:"�0E�!z^"��j�r����h��,��oȲ@Qs�*��h���\�k��XE��N���M�%���J�<���4�8Rçe�bȃ+���<�h�Se9�E��F��~+=�3�c��J��`���s��2�.Y�tZ�k��w�ҟ[�uJ �}I�Ml09�]��t��+�t\�t0%^�F���^����W��BYy� !Y���l-�N�S�Z}��.pc��
�wl#>����kwSG.��B'���c��)��`�Hr"c^�)�z��Cҍ�	��w�c�=;�<9h^(Z�6'�`�`j���n|�e��R���<J��9��Q�*�<���.d�3�xp6�O����SS��ڷ���b��5{���K#�`�Nv���u����ʭݽg�̋��������4�0�ENn�����擀26�y2�IkJ�	�~p�!w�~ю��z�֪�G�J8S�T/�S�T�đ�*T���W-ؾ������<v�g�W���X�=ʐ=N6�຅1�P�i
�`؅=�5�����dՕ�u�jJ��~G�P?��A�i�����l�/r�4u���-�� %���(��B-��v����`^��1��Y��m*++u6I����B"�5ߘu���Ez����u��^esvp� p���uG!΃�V���
�uQRr����\m�+*U3�ś�V�=��L��$��T�B�c+8�?�5���&����7���U/Q���{@Β㤋�����Xlo{ '���N���K[r���UH���I��/�w�K8+�B�z����S��dd������l�}1�0��6����o��ۧ���dW�����h�a��:em�S-�n� v8Q���Y?|��\� ��2~k95�\�H8a�B� ��4��֛~G��	���8��2/l�U�ET?jn0o�2��R !�k�]���^1���>��篧������O�@%�Õ2-wQ��QZ���D�o5^������O��ܵ��Hxx-�|^"ϓ��6��F����NhU�j���;��J��oju���=u�E��n�����F4����Dh ��O�W�^��OQ��~R����z0��-$Єy�!��W٨K��)�ȓ�M��	�C�Xv��o�>�n�`��P���t�i404\���o�%��Up*:YKެ���{�n�=�)`j��Ii���������g�� �bW��@kG�x�J�hZ��ʾ&nj�ګ)��6�b+7�%R+�ZycK_��.C/T}�0�]�!���D>?s�Jd�+���ϠK::�.Q}�fy��4�T{2�����@�����.�>�h���S����[*���k��������~\+g��}ut���=���]E[hr =�X�պ*��ޡ�}�G�D���'5p,M�x0�j_[�+�t�l�MKr��)F(c���|yS̳��+h������-!'dys�L�Fo
�v�D��D�:����]�!�\�%7���|��v���l�97Tj>z	D,�:W7׮{���`�dqp��4!�ly"�W�E3h�tՖ$r�!��NI�@����hJT�Խ�/��ɀ�r���A`1.��Ӻ:�4�];�9�bl������R}P�z���F�`��;�}�1f7y�w�	�.\n;��y�F14�m��?�+�M!��T���G�ӧ��1=~<��$
�^Ѡ��<}S7=���=G�����1H�l߶��͝9}G⨵���4@G�����Y�������+p\m ��K=��l�O�7�O���V���	�׫Q<������`�#��
Q�alB�/��7�5�'\� �uX�~�fLh�R�յR�ei�]h�*��2X���^�&�~��%Ҧ'�ؒ��[t�P�I����Fs�e���B�;�|���j� ��P
k?(I@�z�5�-(�^Ew:��{ፁ�i����Kr��6�u�e�z��)]����[[x�d�+�гc��7��F������p�Ov��+�<�͆�ȷ�}���iݹ�)h:`Kn9�y�8����kO�f;"K�hBۇ+߰�^�CB�,�UC ۿ�O�q�C�V,�ý�!�r.Z���N��3�Nc�o�r��	�Hͪ�5���"�����.k?ZD���a:���g-�}aS�!��S] �������B�br�AË���q0���bx[���C[ɳf�h���f����E�`�mbA.N���&����:J���|y�mokU��QC�䲁D��	�_������ض����>Hu%��K��E䚈�k/6��՛@��My�F���"�Ѣ%M���ľ�r��v�������kTɂݷ�OM�y9A!����k`b��&�u�YD�/���\	q���}m�K�\h!�SC��{�@��U���Z���A<��vg�p��T(����4/�����Yoh)�?[l�I����X���Ƴ��%_�>�,{��0��)�C)����}��!�5��Ao4<p�Bw(��_����(����M?��[	
�'n�q��`6u�`�b�B��b�2��%g� |  u*9h�3�����D��m�j}�N@uS��:e,w�+[h��|�T�����W�Ǯ���'�Õ�7f4Z!�w��	�r��'��1P˂��B�f�)aE���i���ƥ;΢SM�7�"8~�VM��
1�%_�E�¸���V�S�����RD�Yd���+�C"���ېKi�%��چP��v��E-e@�q���E��=yJ�*U��h���R.ʘ�M�@~���p�(�T����,6
p����Z�%�����2�W� ��vc�ej�p�[b�*yp����uGĲ��D޵Q�7�D�2y�ܠ�����)+����XL<)�f�d�)�5�?D%��\�Ff[�/`̢�5�~$78o�<�X�p]pKSk���<�ә|+2f/��Gbm �"����նR*�����e��J���tXgf=�ݜ��_X��Z��d��)7���	$�K*k��-��.j��,���� ��vWg�G�{&O
QI�l1��.��l��F%7'�.r�[�ȝ�s&�k�M�� �3o�-ːs�_R;e��$׭̃;�6J�o�]m��]yT
�0�n=j՟�.����z&o�k6�-�j�CU6���������p[{��X�^M��\D�n��Z)�.����՝>�[�a�M�����B�V���|~��\�+���t'�X�ݍ��5|����
����R�P�.���+]�=�n�	W�X{�L7��jl�tMj]����'��_�:�t��=�F���B�y5@Kv��}����tD�}f��Ɛ��j�]Vy�5�����Z�-��l���/\r3߲���M��7�ԈvR�Fo�j(
Y�Hn_N�L'O9�/���Yٜ���&����+�t��7sD�:k$�XS/Bz5����Plq�[��{=Qwr��?Sdy",۵/��M�.p��*�
�9{³���Dj���
�s�2D�o�\�mY��}�a��ѓ��V���L�����̈́C�k�t�^�xZ>��^�0ޮpJ��L��;;�7�E5e�\��ɑ:�L�En?'P�9�A>���%�������u�'[��p��B��t<҈�<�W��mP}�_�IiQG�u�ڨK/,v�Tϯ�+Nw��z=ڷ�j�d6b��^������`����Q8�uDc�	�K^����gf[��m�g{^�G�����U���
�X�����j;�:���༡@�@RM� N9�hQ^�����)�1��+1�kM��ao]�$ zr�W�K�1����ED��ij����V�K.W���&�8вb�]'Z��=�с �l\"�<i��B�H�����=@-�Y��ge��J(>�z�9*λ�
Z����8'_����D�	i�~�3����׊���د��G˭!�i������)U#P�� L�T�}�zC�M��K���w�­��L�MKi\t ��Å�� �xMU�Z�j��A��U�L�E��`[�G����$Z����I%<=W�Kϕe��Q7o �Ջ7�T<���E>^�^t��Mb^�����_��xˊ%��2K��!���f]�}��ȐA(�8����i�K��0��J�O�?2
Jp�x��́�����s�X�(������HdbW��E���6�O��y���ml�t�7�����rQ���T��t�qP��(v�ن)k ;�
I�U�ϱ�%Њ�β���
]�o��u�j���t]�}��/P*81͌��*��ݬ--pw�b��dr��S�lAv��l[M�=-S��Zĉȫ3���3MP
i+�}��#H �����(2�[�J��^7�0]��8�OxI@�����Ҁ�V�Y�=A��r3��a"�JDom�睺Tx�Dlo�Z���k�	6?	�(��]��U��������G���      �      x��]I��8�\�w��@�q��g��<A��>ILQeV���$g���������OI%�Iϟ|�'����Y��J�?��O��'������hR�S�����'�3�~j�?�=��z�_Iz�����O��gԂw|���'75��{�w쟚ۧ�N�J}������4����ɥ|r�vϿ����O��]�Q2��~G���Oj����gn���&<��<��+��G�!��Q���g\����7�����r���r��{��cg�V�����w���S��ƦW��ꨘ��~����g��X�����4�e^o���;X59��n,4�_��쿮��1hs=���$��� �,��6����������İ����������i�8�qI�&6Z�>pt�5��l�N�85-�'�2��a�K�*�?U�f�_����ի�O�Uh�,ж����P�;-�;�]�*�
t�
mɞ���M�s�0��Wi���:vٵ8���i	��ūg�:��՚ӋZ�R`,�o�}��=y�~�,vZ����w�d�}�QPoIoX>�\��;L��/,lm�zaS.���qE{x�Z.{�j�j��ҏ�|1�d��1��ħչ�^qNdƌ��~�>t��%�rvI��v�7��J^��<�ܔß9|�ؔ4���G�u�{f�k�mz�o	�G��7s�:�[���Zw���~��m?�d��%��>�1+�`���l�Ղӌ�Sfo|�Zq޸i'N��m�FY6����di����u�v���M�_,��JS��V�i�CW�lb&��!,�_�ի�g߶,�x�[sΦp�dak�E���� l�T�@�c$<�-���`V0�b����`{9�|��ٰK�FV�_�NHl1�4z�����L V�S�Y����D���^�uȜy�&E�%<�����f��@<�vH���Nd� ��G�*Ө��=��Kɾ�vY�r
�`��|�,�r���� �0��kX�B���d~*���p:tz��V��M�),m۰����JU�&⪼r?�i�	��k�@�K���לa0?.��[Ff_:0�Id��qu9
i�b���=���[����\΀V�� �q�Ms2��r/��/�D�A��^6��pN���МԊ��+�!���ђ��X�	��a�~fV�A��B"v>uEn�Fn<)2�#W����/��)�����+7.���0)�� 5�9�x���<������K>�$z�ѷ�+Ƌ��R,���f�u�tco]�z�<�_���4`j����K�j�����k킜)���^d�K�&�w[L����J���0���;刃�^��� !�g?E��(��d�;Ǌe��t�Rd���yi�3�s!�v��$�~^4��l����E灝r�{^�;EY?rt��`��ifwr�&��YN	�˕7k���R�������\ͮ����S��̜V<���Ǳ�J�5)v#��+�ZΟv����B.+�'<�x�K9g~�CT��9��Fߍ�����7 :{l������`_~�;c���=�Η�̜����{����ݚY�?�Z��;?j�]�:�4��tp.���%A*��Az@�k`�g$"�Lc�t� u�
e�%cCc\Y��c?�C#y|0�Kr�x1�qf.��K|�-��ؿb�I≒G.��h<mp�M6b2:}n�z޶=>#�4�˔[�v|��-��L?�w�f�� �=��,rB��M;���`p`�W�	�y�
�~ 8�Q�MPH��WF��.t�'x�fN���k����1���/��1fl�����]���B&7�<'faK�݌V3���k�6ܔ�z�6g���}Ƿs�m�`l.Ҡ��){�%�.�(H�!��'�eY�a��f�������a�&"E�G'eu3m̎{�Vlc�cc�Ѹ�IF�Ϫ�5�f�,{�cONT-7�؅2D��N����� �[{��8��xB&[Q�6�����'V9��h���w~�����2-:�������b�)B�G��D�Isi ����n�
W�
W� �.���{�s�o�"�lXض�Nw��	�|�-�F�8�/�Mq�) ��F��--��nfߴV�x����C<:g��D�>1���g`�^2 ��m�5���y��k�>8#ewxeܥ�Z�J�#HIEa4h.e���t'Ň��ZM��7�e������fZ��ƻï����Y5oJ�����,(�m�dk�9.��Ă7�R����2��F��Wtŕ��o*���r�X8.U����;�C�h$�%��@Z��p��X �ֽ9���Ug���s�%�v����$;I.>�]���O�Q������@�k�蜕���mE�Y�O$�-ڧ�:�&��~ 6�L��YD�k�ަ���Ӿ6�2�ۗ�O;+ٹB��;p� ��ͰK8!&�
oSv��`^��bY�A�{�ݧ�Vr��	= �no	n�!Rx��[�Cw��v��+��2p^����9���]9`(�*wx�����>5�s�h̠���<\xi'��u^�2�ڻ4��"����%��&����h��d� "��$4d����T��9(�"�x��0�j��+��sA)b��� y�X��p0M�Jٿ�����Є"���t�|gkxR�*�	7��d�#x �K�⠕���,���p��F�4pp=�d^�a��R89R���֬��U��Ć���]�ܔ�M�Q	��}�Z@����\~r3�#�}����;SM��Ls}�E��1�Q.�~Sb�Z�B�U�6��	�{����~�qW����/���Z�S���m��F��8ت� ^+���"E�\��{�8ȁ���/��'�f��ceep�pmW��g��l\��?1�U붨�0����Ե-j�KAf���1�5�eI�An��%z`钢�h03WP+�o�]��P��5���I�C��s�� (��m�@�Д
��i�$q�J[�?-�@���"m��h\h�4ʁY�Hy�g8��4-s� �S]�޵�0�CP^WΔ6��m��4�����L�z:��+1m&���0 �TY�bӬ�( a@�|�1�NY�O����%�w��-��"@r��^�M���om�_����ٲ)F�C/���B|��X�ӄiݷ����=j���0)F%P���HK����C�nK��!�vi�*��i"���cH?�q6���jA���i������J��8m�%"�o44}�CO������2�	�j`�U/���R���xZ���a�5L��I��/f�f��23���e���U-Y��TL�ؠ&D�[��K��Yǰ-��?H�;�'Uر�u�ȝ�k�e�u��j�# ٤t��\��4i� ��t��gFn������P�[峅i�W�d_Ʊ�<^~.GC�fr����c*�}30��[�J-�"ͧe�yǚ�����ҕ/x{�g�g?��$r�����	��hZi����A�@�j,H�P�T1#�Xeޮp\h�t.V3:�OO	
t��ѽ����``��C�`6��C?��T�2��[�ҵ�OF���ַ ��vlS��[�@��t��gԫ���ϋE�v�ݝ���٘����&��a���bWOM���=�U���Z�):��yo[��P�L�`�i��-Cn�6�1c���x�(�To
nW���]1s�d�̥�������$�ͺ(W�(r�HY�y�Pm�bK�`'{�/���� _��+sH���%g�5q�4�����v�w ˣx��瘶��f��_�g�S��Q��n# ���e<U����)�l���,w�;��t|Q����06ma����M�� >Om�M�g�n#��L�-O\b�(pȚ��T�MW��J{3�S$�tO�Bj�a�n����a�2������,p�u�t$�]{$�8tG�*��`�.�4�\�K���t�f�ۦ�'Cz�C��4�>33��33.���Ы1��� �Թs�٬dyB7����s�q8��-A�4���]Alrl�� ���`]ec�5=��m�#�<"ܜ�+m�z��ǸR�H���o�    eӛ`8�<eYcw�P2|�xb�����7!-�/�?�ɍ�Xj �{�� 3�R!���˺�N�@W���P�h����l�k�?U�,p��\�J��� 5�x���dt32�O�3,{I��� Uh��gs׳�|ӧf>�F]6å	3��G�0S3��ⅵK��G�]ZZ��]�c:���ipz��P�'�YSu˅��vv�-Zs��0 H,Ln���8y�.�Ќ%,�9�yD���4;9�s�Drd_g���jJ��WnV��p�,���#�y��ij`O�%�{��'{l�Ά]�y����e�r*-)�HŔ_�> phyJ7��8�Yo���A�C�p+Q]M)J�e��h\e��$��XkT	"+���Q���r~&�*9�� �6�A"�����p���!���d���Z}��vRYO��t\
T��3�b����Lܳ]'��:	�e֠� ������@�@M�.��ԧ���4��^\ ô w;ͱ7��	6���VEGXH���-�w���z���L���}��0�N�W�թP�����7����;^F{�h@Ǩ��k&����VZ��'�mCQÿ���~+��j��^�7�+8�~V3|;	��6�V�Ը����~�!��P}���^���l&��\��(ޢ��=�����[
���%�#�ɉC�[��;�͵�/J�s:�l��lٳLfZ�4w� p��H�`�
��q[B4�1�gk3N�}��Ջ�Y,�lF4N�Xu,����U�,�A��K���;���í!g��}�w��`r(ю�i)�_���'w��t�EHk6g_�,���$���E�C��A7YlG��A~��o7ÅػFB�z�]���N�=h,�� �i��4v���1��f�V>p*m#��YSZ@h� {Z���7V1�O�Wt��Xd%�8s�<�Kf��'-���Q�M�\���;�~vjr4�T���r# ��p�r�|ʣ��r]/�o�)���v	W2iw}q�]͏\��D�)�n��T�ҁt ���L��^�䭡O4�"�S��f=uH��U��ǉ3j�x�J�	�l0yd�Aw,JWÒ���co�M�_+g�cZ��G�����*7��?�����""�ĵ��l:x��J�p���Ѱ͕��j=p$��h>N�Z*3�
GD�~6��g���By�}�r\խ��l����J�_��M8(�􆕱�~�.}�E�SP����<���>�X
���Wʢ�)*���I�֮MwhĒ�i���ٮ��j����E-\��������_��(�թm��^ΆgS���S�b\�������.��8w�7?J*(`�(w}��9Q�Hs���y>�r�3���g7��T��V
_�� _�M=��@E_K$C��荠9�B�p]��>���"�	G�}��<V��[�ћ^)�D*�Co��D�y9���]��+V�F�w�غH}6�z�	�@[l�i��X;g�e��΀'��8��h�N
ص�xTR&(��@�x�q�G�
�^�7�$��'F�#-�e
x��A};���0���%��5���$�J̬(��e������Ќ �V�h��q'�i[+�2~>�K00������<�M9���p�\��ЃK�"Pe�]Тy���:B �;ξ��a��c�����v��]p�}seH����J�6H�A�"�6�@�LCx_pL!��tQ�ޮwbԬ�k��8;<U��03Ȋ��;DS��0�`;���ǲI�qWN/�V���|��	���z�WS�j�_
�k_�I���pf���j&�2\���jP��0�\bMўш+�H�,.��"K��C�̿�^��P�\9�ٲ<�&����{���9��}B-�������/�{U��H*�~��/�{�P@��s��R|� 	����6%#h�7Œ�t��ӫc�ѓG{C�H �f��-�s��گ���۪���7���k��W2v�CWN�.�y�)���dls3Rs�󺕡�#eg�:� '2�lyQ�����3qLp#�) `���b+�t��D� s��]��,v_�kBE��XEBQ�{��ft0	�Oھ�s�n>�bV{�a�K��Bm����<��o!��W��o ���d��,Γ�#t��A8ĴѨ�&��}�`B�w0��G�w�k�tD�;qXҏ/��X4@ s?�vj���(��yh)��j��8Q���rg[������`s�'O�W��b��m�l�V���S��l�B�(z�@r����"�A3�lI�%d'ǜ,A��K�$�<q��Š�_8l�(J������h��m޴E�"#\-q��+X��mX_z�~�z�ie���:>݄���:�"�{��`1�/IAj�nyF�X��	T�~�a��l1x3d�k�Me-@��K:) G۷J���٘Ԛ߆��b5�Bt���S��PJ����>��;Y�J@��/��_pvY��>��_<��ad�et4\'��V�)�'v��;��n|����eٯ~q�����}A��v���g훶�x$ƥ|>&��5<��U�RЅѭ�>����"���	B���qG����	���涫K8s�'�bސ&�>�[78y�R�E�ۘ��B�����N��w$'���F+�����˧�RƮu�X^�t�~�����j�jw���֦��Lpj���E'�d@F�y����y���j��T.�\ơ�x�}}rx�̞�wrjU�4��
11}�2ČFX��P��"���[K�_Xx�5�e�gw;eH�����L���� Ln���,���/%j�6�d@n�;t��v1M2��ml��K_�LNUב~��'��>]ep�.�.�#�-��+fl��;P5��H��b& �$ݺ��z �^N2��[
���>�#��ʴb�/ȭ���и��j��RӘ
�@�u�K,8JH�+7{�'F���a��;��?1삒g*X~���˜^�M]k(��AM��nE�#�i<�݌������9S}F/�d��Ҍ����4�,<�?�Z���&�E�x�������CU5p��r}�a���U��wc�ԙ���Ș|a���٫�"��D�k�p1���$�C�a��~��0z��(�[��M;Sh	c���m;f*�T3���B�ۖ^u\Z˯��;M�d�bϕ/.-��ffH�s�_�,'l
]i��KiTC��ZhIG*���]�,W�5�6ƅ�x�AuɄ_ܳ�&��O����n[e� #Q9�b��Ñ?�7��lg1bI�t-�r9����Q����?����r4����.�%P v�"R6���e����k}�	X���9&Wb�׿������D�΍�]ŨwN=�M�1x���4'����� �ҍ!0e�0��U�\�q����o7T<��&�T��V�M4L�����W���/�χ��M6���s(��[��S�I\=5��{�C	~j���s�s��C����Qzy�4�q�>���HLUw����3=Yv�N��5�E;��/�iQ����02�LY������-h��]���[c���1���x_�k���Q}Vf��{y� ع�sC�zb8�t����u}�����?��7��gW�S|����Ǯ�qB��-�M��3�����+��g���<����F��}��@�����y�w��o:���L~�fw6��s6��0����4�T�l�b�A��4޺�>�E%�f�o��Ӳ�ȁv��~�������&D���)�d薔�e�~Y���72}���ꩧ�$�H�"�����M�C�;�eJN����6��P������QH,�ј����ݸW�/��ܘQ�<���j0Z��݄gI:4���s�v�&F1���ѳ�)��\���=F�%�����<WP����M^���wX�V딆U�F�<h�j��n���U�e넓^y=�����έ�E�YA�2��`��|WQ(%�ۼ*Z� a��������,����e��*M6H��\t҂"T�B�FA�iJ��0&s�/B{o�I��ب6O��`:���𨢯<)�B�%Zq0���b�ؘ�5�!�W.�-���% �  ��I�z��6����o����xXX�׏�
o��fp�.��9r'����@=�ϼl�uK�`}G%H93=	I����F�aDAR�!����,`��/XԸ'?�Qȶ���R��y�i���!�t$P��he	īyV_�$���[�J@������^%��4D\B`�yY�|�Ӥ��B>�G�m���-V�,�o����&�bkIhci���Z\���̀+�`���6����8;t8�}�-h�%[����9�{1��
�a�KǼ�k0If���X,� �~�+�H����"�l�SA�g
��J]���X(�M�L�4P�P�	_/���NJ�iB�vRO)��y�ΡG�=�r���p{k-#��N�)_�����<V�ŝNVXV�$�H��i�v�zBabU>ᐧ�hAz`X�iKW�7�����%~
���+E�<��Β2dφ�����Bw�ڹv��E��ec�Lw�rRt�2��n|��ϑ�q�{f�r{?�{�� XW)��l��]������ba�?����[D��S�"+�!v�R�\d��Lu)����j�j�i���l.��Y6$:ߝL��.BP�'騖x�b1kqq�+O����E��D��U{[ ���#H3C�f6�o��
Bs�;�a4Cp!�����?c���@��z�Oth�[<er�Ut��󞸠�Y��4��o��&*W�j��o~��h�0.y�Qr��� `ÝS�@�)�������7��z��0�'����8��Y��>"�j��U�<�5�-�@�fl�����S��G��?nb���D*�Y�+ܭ��!TZ��D�M���+.��X]���﵁�;�7;���-e�v�����b�T2g�˗vC �1qM��iͭ���X�U��Y��Y�5�Z�, �"rU��nY�DI7���Bb�;�DEI���@���%s�g<���a�0Z���l��5j\��[��Rۧ�7?jn�{���� �xc� � _��bs���x�o�p���X>{B8Q�l��P���t�`�֍���c�Ƽh{L���?5bnA��D}�����½�P��7�-g��-SX�����w�XNҹ�a=�*
��i��b��ܶ��j����@����?�i��j����~nt�
[.��zc��"݅"�-��.�eڸ����P��hCy��ʏ?G�y���.-��3ھ�&�ճ��� b����\��������v|?-�5�m\YG+��
�84�(�_�-<��:��tḍ
��}�5un(���	:��)�%�m)kחb�/ʀ�h�i�!S$w"�/�u�Nl�J��ܟy�첥%jo�E�,.��SVK��TVϾh˯o
��o8Ҙ��Ш<���'�}q6��<\:� �|m�Z�,�ɵg�J�I�{..	�2��`Dx��SJ	��6���
5�1oY?��>��n�0j�����ck��O/�r�־�. ��p��7+2n"	����7���7M�)�tT���p�o�!8����u C�Ř�j���-����-�Obw&�7�(�ݧ��`��	�*�PWD٢/���KͻD}����0�y�[^�����B����yg�Y��tzn.0\�%ʎ�d/4�a�ч�ջ�T,�����d����$��j*Z���JY0j�&ri�Ƽe��W�]D�o�� ٰ�)j9п�.Y���S��U|�T_�7�3q\���\�+z��e.:��4��l�n�il���d��v�,�6B�޼@h�{���&��cJ��@�Kĺ��QV��K�w�,�ݝF ���:iS�*ΫYE��`��k2��~�9�&)1-�/`�@)H���ʷ�Ύ���qZ��h���w��,�*�i�d֡Py'8m��<�6�pUVtu�R�=*_�\�K(��2W�e,>*�쮯M/o+�ޒq�ms|���*U��Ơ�6���#�9�D}�rT��I+[@�h���	���>#o_!-f�Բ�,� �����������Ń�KJ���f.�kV77i��̶�%��e'�e��I옯��#\����=U<*_<�u��_��p��fg�8$3j�>	�o��ks���6������h���_���P���Ź���� \vD2�����B���7m\���#�0��Y���W��9p�V��v�fK�����j��&M��|s�A�e�MfVx�S���x�c�,��@�Q'�ԉ��H�E�!mİ��G9�9�w�F�����~���Nj{      �      x���M��JnFǝ���$%�*� =h�0��[y3��Q~�=\����I������_������?�㐿��s��q��q������~�����^
;�ڝ?�������i�`׾v���`�￥���v��7�w��i��a����~��s��ƴ���<�E7�E}ڝ�;�����r���������7�#��$=���w�aw�'�>���z�T������zL�x��r�"0��S��v�+ꪆ�@2��#��h�GWChF�0�3�j2�h�ƃ����"�jĿ��Uz�ت6�l$����/��Z��K�9�&�o|��E��ȵ�����������gEC��B9ڗ��X���(G�{�{���=����B9�c����I�P(G�wU�?��I��Q�n�mV��:�Q�>���~Q���$�o�+z)�����o>(G���rp/�r�����*x��i�X��Y�h5�r��w�w���Y���;�6V������0׺��zE(��X��&���FC(�u�D~��~��]���b�����������"�w5(�]�[};�#+G��4(��cM���-Z5(ǦM����cP���&����[^�A9�}����#���P��!�����X��>��?�cѪA9�㯧�\�F�2(Ǧrj�'rʱ���[�V��ʱ�ل+x`/�r��=-�?���W���דay�希G�9xy8帎eu�t��0mU�o��e�����q�9�)�eY9��=ι�ϑ��^�xLPV��:�[�r��������k�.+n�x�s�{��,��+�����睕m�}��S('��)[yK��+��БtHY��z��r���s���;��]9�����	�}���>'�������*/�W@9q�TvdaPN\�V��w hz�]9�&W��I�N(���$���l��'�s��*y��Oֹ���9�r�lsm���	�m,�wP���9�n��=�]ǲ�O(�\�Y��
�1����^4�rΞ[i^�\Ǻ:N(��U��r��:���!W�!9B������3��϶�B9�AW^�pV�s�HX*XI�P�զ���{��\6��ӯ^P��}Α�#�i�ʹ����W/(�Zr�+?UApA9��T��_P��s+�	�������{>��:>ly�7�sˈ0�n��Wo(�����'_��ʹ�x��������+���O���*�s��hU��n(玱�'�����B9w߭"�G�~��r�k��"�	����xg%�|_q��X�#K&]i��c)��^�&�7<�
�K�i�{��`��{K!����ji�����\=Y:,}��B��hx���z��xW����\k6���D�`y�w��!x+7,{�u���&�04$K`�KS��E~��K�* �":6ƭ�W�(ˇ(iK��5����E�9ĕITY��,�)_9�2��HLu�X[�TY䜊/�� �
���5]mI�[���>\� e��tX]��$�8B@�E{��6���R��݁%�-4��7�|Ӫ[�e�������А�xR��qe/��˶���I��Eϑ!ܟN�Y>��mB˖�@a�w�b<5�H@�Җ���e'W��l[R�"d���_%8=5(��C�r��5��fsE����Y��3K�qʹ�|ԁ'�~�%�㴴V@�e����������_�8���������}6�-o���i��6�}c��;?�ׄ���W>7��󱄆��k��&�e �b6�B�xV- �b�L��V��p��	Y�H��閭���ΡQɖ��BC��^�2�Pg����mR���̠$����[��Y|2 �<[�+ ��KBV�� ��g�I�*�gF&@����D7�O�g����|�~�D55�}?���R�
�,�!��)J=�А��)69Қ}	 �D��;�p�>���tMKh(zL��mB�-1�4J�C�XBC�cj�J�����BK��<t�Z^#c`h��MI�-q��^v��;^�	@�D?p��n[)G����}�y/�l�h9��2��\W-�E�5�{6`��=����h�t-�����@�������?ĺ����C�ߖB��s��U�
�Oi9'W��6��@�2��o�=��LZ:���x�����r-2{ͷ?\�-��|�������Y$��\���ir{pi�z^VNí��i��^v�g�Jeȴt2]�[:�{,��k�eG�kKh��~��FXBC�r��k�+w]�f�����}O˽����+|Zn���m�n�e �]AE0�����ͳM��D-w��7;R^�`�r/1uY�)�����C�&�ׄ��ɇjoR0��װ��u�Q8�N�!���v���Z�����yM�֣�e���O%��(8��`�TH�T��X6XN>T��)8��Z�rD^:�Z�~�Q�5�q��Q�\�r᪂S�x.���S����<������N��uT=�*�|��Rpj��Ι��<j����:8�ֽ�l채�d�8��!+8�J�P�@���ϥdV�oz,�!�����k22Vpj�������a	�9�W�;/�`
N�r��Q6����А��>2ה|(���:8��w��tKh�sjF�s�����0|ʾ֕N�:O[�|J¨㱄��kH�� �S�S�Sˆk�HJ��U�^f5�`��c	i��|CВ��V��P)h�D�KhH{<teO���[�-8���[����
N�M�*>>�pjm=�.+�(;8�N]��?%��[h��3W۰TIׄ���;�߬��Z�d�5�pzpjm�ݛ�w�I�����Y$-��v��|O�Zm�C��xjpj���:�e��j:�z-�Wzpj�uѢ�n-�'(8�vN���V�[�����f}k�q!�Vpj�y�Zㄤpj�Y�Z��S_8��5�݆��	AC�5T�\K����:8u�??դ��V�y�n�b���S�R�\��XBC�Bz[<��A�V��C�n�tMh�{<�j�Y�\�Z=�5�Λz+��up�]�{�y���{<���A��Z{�4O�F�RX�֘�V+�c��Sk��h� x���������>��P���ʑ�O�Z��(u5���%4K�F�o%YBC�5��'�d	E��|�M�l����C����[pj]9��wN��d:6�LwN�g�P�\3g ��z�s�R�����:g���
ֽ)8�.eӻ6��k*8���i�g�oｮ2pj=c��zv��'��u����}��
N��l����)_�ֳ�e����L��uO�ɚB�֫�C���
O ��k�u���!pj��P�����Z�˞��-8�^>���4����zu�9���S�uηRv��������еɖ�e����9��S�\]�Rpj��u�i��nN��S��O�vZh�֡x�s$�%4t/���+�e��zw�x��T����:j�7�A9z��{9/���"���������Y}8��}/+l�S߳��Z�{�)�e����¤���VK���g���׽��S���Kl��X>��}/��cKf�nG���)�c�Nݎ��Z�ƚNݎ�eu�������zj�RO����S�'D��Xް���j���8u�9���h\�n"�=�?�]���M����$��V������z2��Nݤ�Cw�04��>�А,���'\�	AC�5$����ׄ�����������r�Q��p2�������z�~���M�������S���uҶ�Op���Z��N�t�D�5�c�4��̵ƷAON��ǝ�4�?������F}�?8u�Y[��-=!hH����:�>���ι����v��-#;*�'�k�ԭͼ������S�6�aD�[h��ڏ������ۨ���ٴ��ڜ�;9�F=u9!�4�뱄�:��B
[� ~,���S����N���i�uJ@}��͖<~�n��[��Q����L�%4d�ȠMe��ɇ
�HS8u3�s;�c�	����YG}��,�![4T����n}��v;%8u��EqS��'�2���X�8���1�����6p�6�w;�,�!_�:���'�S7_f����*������rQ� N��.�u,��i���{n �  _*�5�ޏ%4��������^�Y�|8u���u������\QG�YJ;8u���c��ַN�B��+��ģNݢ����	ܥKh(z^V���;�XBC�c}֞��S��5h�~����Ŝ%T��P0p���L�{�c	�����������9S�qIy68u;������٣���۩�w�l9e���mL���5[��o����{Y��]"�%4t�ڏB�r��c	����އ��	���MZ�Н~'4t.~��>V�4p�6f|�w�韯Nݮ�sJ}|"����)�c�O��m�е��M=�	]m���38u��@3)�+�8u�����ԃ5p�6�w�"Yo���[��~{��i'44�7�6U5p�vM?TO�����۽<�r��$K�����2�"�z,��������
8u�g�G�k��g�tU�� �����*�d	�K�}�<�7���~^vm5%�S�{��;o"����~�nV;��ږȻ��}<�1
,��������S�1kauS)�f�e�����qM��u��3Y:,�܏}b�k�XN�XcO�<a�5to4ı:Nm���J'p:�1pjs?�[��8�I���6[w$�6��W��	I���Qv�8��R����
KhH�Xײg[�{,�!��C���q��S����T(�Z�6��}=�)��S���~7W����w��e�Ԧ�+׺�F��S��������㱄���e�:�H��c	霵X�\Sg��S��ԥ��r�m��6�~�ƃ]�C�Ԧsfö�x�8�i����)y꺁S�,��6 s$��^O]|i��i�Զ��ޜ`x.8��y�Qg٦gNm��ul�R��S[k�w7V;��S[�}%�o,��Ω��7c<!h�-�eE}w��z��j>�ׄ�ڢ�1z�[h�s��&���6�o��֦��Nm&�7��q��^O]g�|�G����lΰ�5.)�6�3�*OH^���ׯiX>�3pj�������@C6c�ڏ$����m��(s�J���S��^�z��T8�����d�-8�y�Q�(!�z8����V�t�8�y���x0֥8��<��uJ�ǃS��PB����3pj�S�)�ix88�����gt����S�/�P���c	�=w�MKpj�c>�M'�pj�s?�\��#�S[���)B�5pj�Y�_��I���b9��}+c]e���Wz7��ׄ�����5ˤl��1���-iR�c	-�����s��X��7Z'�S۹�Y��[pj��W=����S[�Ե_��3��:����������yY���{BKh��S�h��D���m���=P�c4pj;g^V�N)1pj�ԅ�Z��`��v���d��+��ڮ���5%ł�%44�QﾟĞ6��k�(�7�-44�Q�v$V#8�]�1�9.�/���m�S�x��/8�]�թ�)b���k�t<�Z��ΩkWQ�nz,�������X8����ך�8������D�S�S�={�JܗW8��s�p�G≢�S���:���g�8��>,kn�Zu��{�/��$Kh��{YQ_��7pjs?|?}o���ۺT�1:8�/o��-�����}�O];BX����~,�І+,,{^V>��+������5�c����~,���,_���e��nN�g{�rr�:%qpj?�yY�`��N�Ǭc�Q�엃S�̿_:*S���S���a99-�AN�25T�0У�XBC�����ɪh�v�{Y�1�I�N�S�_�;88�N]�I�upj�_�:>t�Z-��>�z[���N�}>u�1w�����S���.saK����>�S�S�#�,98��O�~� ppjץ&w.�kBC��(�(��W���}�S�r��ofAC�5�yB�,98��R?��F,�����x0�O �v����>�vpjo��ǧ�<N�c�G�.��N�M�?��&�t����P�cl�Z�S�sA�upjo3��V���2�z7�������rjVX98�N�� g�;8�����&���xpj��ݕ~$�a88��z�R�gd<�АMm�&�M-s?v��>���fc��㧉��m����l�	��>>�X�n|�N���:v�$�}N���l(��r�ڭ�(j��Y��rpj�E�E	�Fz,�!_���;�]5N�>gX�/}�����ݧ����� N�n���N&��88�����ʆ��S�ϙ5罩xpj�勬%��O���Q�|��?�v�~���ѿ���|�ҭ*E	��}/�aT��S�������s����T�-?����ԥ�4O8{,���V6���}Mh����'3����XBC����̎�����c�C��S�����O��ۃS����YZ�'8��K�G���}wpjK�+�N'�N�}>�n�D�����~N՘���BC�v�Y[� N�g��R��p2�c	���c��=�+��>�Sohs�Bqpj�z3[8�D88�_���Iq��S��O]xߑ��گ釶�e�n���ϧ��ٱ��ՀS���ޝ���98�_s.����̆������}|;q�������~��u�V�:8�_sfC�KM_>spj�g<���N���P!�"����^z�w3�q��ИO]*8�/x,����w�M����|�Mm����ϧ�fW7}8���z�Ud��~���|K������܏B\2�x8u���d:�)p�8d�����}<�
�·�n_�@�SǨ�.S4}-�4X�zn_|B�SǱ�mb�u�p�8f^V'�t���X;%�>>��c�S����N�7,��JLm��+��cp�B~�<� ��1�z�M8?!��c����-�kBC�G1���s?����j�:d�l�>!|��_{s��c	��/��
g�8u��C5g_G�S�,�
�dM~�S�.�T�%I_���QO]b�ܩ�XBC:�P=/cUt�SG�O]{5O�p�P���Pǁ�	�c�LJ�o��CgoP͑�=�ԡ��ͧ��[p�����o�2Jp�О��fR9���:گgG�o�::��By$��N�Sך%�w�~n_�G���Kh�um(l�5�:����>�8u��z�)XBC��e���w��:ڜ�_�m������ŷ��	N6�r��<�p��Q�uJp6E�S���%Gjyjx�S�-�cJ|��p����	_�� ��������:l2ƿ�&4ds�U�˘�8u�zꪾ���:l9s-��s?�:��)>�T�8u���j��Ż����7_0N��:��l(�͒s� ���ʶg:xBА/~hGD��	N>c��J�8utN];�?y�	�����y�c	y��
m�L'��#�*����� ��1��6]�M��#fY��tN�;�u��n� ���{�n�t����#�ޠ��nFR���߾N3�A��:b�u�Zؖ�	Œۗ�'�SG��m���V��㜹�z�18u�z���V]8u��WZ���tMh��~���)�},��s��WXBC��P�.w$p�8g_G=9=�[��z=�6Cg�z�S�9�vs��>p����<�4�W�Sǵ��M�bp긖���	�np�zn���V(8u��(���'4Կ�X�t�4� ��k��K���x�:z=u��ly^M�S���Z��o�8u\K^��>^�Op�~Ր��� ��1���Ϲ�������Z�����	p�?Tv�T	p��Ի�E�߂S�ʩ�O�7��:�|�:ѧT�8u�s�P�K�:�s�2cO����VjO[������57������>��~����������2>�      �      x��]ّ$9��Δb�5�7W����� q����Ou����� �Ce}�'�\����?)�o���~����7j�O~�-�?���O�OI��˧��!�[����[�~�����O^����Cz>�O������SW��g��m���g�1��)�o�/g�ۼ�|{|���͆�و��O�S��O��~�3�.����ߟr���\���/�OM���q��?$@������dlO�������܎��E����X��)J	����B5�="����x��w0ejR&�9�g�)<6��/�O-��s������Ţ�|~�s�]_��핞{S�yr�4��|qj3����Խy1�SV>������r�S�w�� �A,:�.�s{���wM,:W��.گa_)5%���F���wN�k�ٯ; �/�H9����_Y�_k� ����Q�?7��
���~� Yi�jхϠ�礷�d�P�����d��h��Q�?-V�Qܕ��
 �;`��0�9�'3�3��fZ�M��o�+�J���,f��A\��+=��1�uA�ª��c�x�Nuk�S��W},�s��~��+��38��\�T�ZCeѮ��y.h��QԹ�����ݭ$Y��|�}��ó,!z,ve
]��|�9�+]y�)��E؝�V��O���;=���_����\
tq5����;�ٺ$[iH�`��,�-ڒ�ϲ�N�?_��$;��~�e%֊<����6���8j����Rj��N��ZW`O�x��ϝ~캾ۙ����6��1�����Ϭ����ƌ��X��Q����Q)�wg���}���+R���7�7:k��bFB�5��P`߶���U��t�X�Z�*j�Ŵ�q�0�y��MRϟ³�͹>Z����cJ�����P�z�fmI5W���(�^�PS氳̱{EBK�K�1�_H�l�Փ������sj��:s���<���c gA���&�~֧Q�#-��6�c�����SW��ǀ�H������Y�ޓ��S��w���J]���g�Q��$B'Ym,+�qnt��xk=)�����mk��룝+V��SJi/0�%y�ʟ'�cY�*\�-�#���X/�10B4`>�O��m,�V<�٩�u{>����=��{����oVvY�A�]p�wur]A�V�>J�և=��RD"��;�kg���5g_��9��-ך�m�k������!6�^U���W	<'�[��'��Q�O_!��^��c�m���a�����(���`�u��DTi�qr��XG�|4�A~�:��
� �P��w�r)��Z͜�ㅼF������@���]��������	u�uv����{?�y3� 3�K�@������!ʱBd]i2R�X��	��8���M�KH�\C;-3B�<�>�a9RN�_W��h&��z�)[�fonQ���8�����,��e[J����g��R���_��Ge�X
"8g�8����՚/"V�k�Y�9#5���$c}�-}�@��8a�?��訅�s?��S#�&���騅aEq��JLhl�z\]����q�E?�����*%)����W�Q �4ed��/�u�Kx]V^tV$����88�lU����؊�z݉���ȕd��~��(����Y��Rۜ���J�
�f��#�F�g�P�:.Y���cA=��H�ʡ8��s���c�_kh�l�u4�zm�<V>D�K\*=����G&w��x;���
���r:ɛk��Py����aϐ�)m���-���)�=�#p�A�-�*��-��;���m�,U��{�(�u|��Ae6�/�_7Z��T�������m8kSF��n��٩vw�x�:�W�Bk��G@���aw]4�F���?�b6���_H:[O�ɇHmͺ��~��鑍D��yF�!/��0�'�R����p^��jx�*���s�%h@R�K;�p�����z��w�3Y�u�Z#:�뎪��U$�J���Y!1��Qw�%�+žLgq��V�.��踀$�����5Vc1��B����;(1pj��{"�&C�����8�S���Q��~G����z���YH񇨓<$ڨ'~��#V�}�j缄Z��ߺ�Yk��Ol�S�E.�U��a6�-Rg���I?�@u�r;q�ʉCz��uy������u$L��w�X��v���o r����Ѝ(B.P�o\,ܵ��m-�"r��D�`�N��t�?=q�����y=6I���`4�e,�fP��F�H�WR��#���;��n�@r�� !�%�i@r�/�����N@o�x ���d������V��s���_�Ydh�j|��eS�]�ӛ@'��c�W*a�g��*t>����!�W� Oi�ʉ }�ģ�ƪ���:/�Z�P�xJ@��!�h+qԝ�}`C�vT���[��_���1ZvV.wO��N���ܮ���.���(Ƞt}�V�hT	���C�y`�$�S
�P]��H�
�ѧ�M$��&��rf��:pś\��tM���:����	j�%�C!	���xk6���y�v��q(�$��r/���#؁{Q�'��3����%���f�mO�=��yW�$�~iR90��Fv��1�v�؃�V��Fa�*���\���sw?Z�Dy� ��I$��_����ۯ>=գFU��rI Op��G����nԓAǅs8�JS��U���|��s=���2�a�ɪ�s<���&���H33;0�hr���ՑRBK9�.��N�A^kU81>��S�0\�N�F'�$�nI܈�S4�.?�̛�ZA@'��&��#�ӊ��5�opl�,�՘OI��X��+�QvO���]f�c7VK"ȼ�&�|#Y��lJAp��1�ê�dT�wg �ab��"�|
o�8��j��~�q�l8�Ո�T:��b_K����fR�׳��V������\�>��+�o��,����v��hԏs�F̝��yf�(���#�[/��<g��$�7��F7������Mi������F���_���i�����&��i��N����G���Ǜ/�Y�d(_<�*�#�5P��q��j�&#�l��x���"�]N�h�"�����\�=o����4����L�JϹK+�ٮ5ǥ������)����
�m��(�W] ���^�ɰ3���8�q�#�E��8Ӓ Jy
�3з6Mױ�,A�G�^'����G,6�7�ԂTI�g���t�����m���$N�c��a�L��Ț\9�W)D9ѡ�8+��Ʊ�#�O��92��D7�J�|�ז�A�5�W<�.h1������9��>F���It�� �� ��=\I�8x�D|}Q�����m�w^3H�M�c����=z:Y�A3��׭t\�d��<��zo'��h�[�*��N�B>ͧYy���iT�8Xi�6$r�z�8H+�Fe,��%0Y˺ts�N?;.u;Ӆ���\L"�������z����1�N��R�G���^c�I�%����������r�����4݋G<	�|&��3L�P}
G�����
�� ׀�KvI�h'\�"j�1 We^wב^�������Z\)x�I��!�%�4�z
P<�8��%��Wa��̇�T�i>A��G	��5�����L~�S��|J5V�F<XE�$:@��yO���ww��d�<@;�7X"�����cH�Z���WY��;�{� F��S�M������DU��-�wZ.,�Շ;W���28ޒa?�M�K�M�}SUNp#Ng�=ef�^�Xk��e>��8�I�_'�K�=�Lt�O�e~��.��,ć�N"��2�E��O���˪O�MZc��:��0�(p@������c�#���Q'�/��v�5��!���[��{�0��ù�2��,W58aO�/�kOp���.�*<���Wmo��H}���1�b��$Q�?��^&GydXoR�	*[{9@�'=>�Zk��+�xr��f���L4D�v���+C:��ˤ�
�p#�KT4��a
������&�y�yI"�꿱�:X���w�5e��4/�    �҉���=�� Ah( H\���?��R� e=�8�Yӟ /���ڱ�Π�����)
���R%�0��\-˲T���
�ҫ,�6�ڃ@ ݬ��z���ut�g��ֶ��t����`#I/9*2����D�I:3��%0<d�zI��4��e"'b;+��p�G�s/��7#���<��׿���:iRPi�։)��؋��]�"�`��#�����Q��@�[��j���-���yKZ�o��/�2K��5CM�#���#�3m��8��SZ�3����
��9 �<S6�b�ґB��\��@�G�����	H�m��K�>�U�9#���hTn/�ҏr�!�XY���T�;³�]�H"W�h�*q"7NrM��L�	����j��o�ש�q�����U��D�������Mf�|^Q��(`��&� �`������*���{��D�K[T�#��)chgu4�� �+��jW�Z:���x@�Dчx�i"���iϚ}2@�o{�~Y��5R�E-\���G�a�iP������˧�ޏ3��2����d�K�|F,������d:���.S��J�b��4�k�Ո�U�!z�䣭({�tuMa[>�(���&���Y�=f�s�����dS_���S��b^��F�HE8
X�!��ZD@�9���MR
|j>�A]=gY M��	9��`=��rf�/���Q�D����_<�	��4���v�1N>#��5��@ܬҷ�)�j�Ԡ����(Fֈ�W�¯d��+V��Mj����ɸČ�_ՄE�ԥ�-=��,�-��p����[�F���m�=�X�]���u�%�H��6�^̲[��t�+=1Ӓ�Lֽ׾��_�J.|��6�B���'TTE�yWW���~w]�c�h�`L@���T��� �ᗄ=.��ݹkx�YfTL%y����m�  �f}QU�Z�K z�v	�]㷸�Aq��j\���5��~�N�$���.{Ǚ�b.���T�;�A ��5oU�z^��\v�s�YM=G�������V�@�.�*G1��L���!�����F�бn�vt�m��#h�_G7%���k�T�_�M�(�T����tDR�@b�&gD��	���}�tb.�����T7�$?Ϋ�x��� ��H�{���F�zdCl��H;���udQ۔�[+k�)����ڨ�T����m��Px{���/~7�`��6׈�.�	V������M9�p��e����t
wf�o*K�t��\l�--�l� �#�Cw$�Q^�E�m���rg[&���&Y[�[�=8o %dǈ�d�
E��eWe\C@�<�8����ſ+w�Ы��nѧ�٢�{R�=}����ڞ޻$�4꺧Z�]�wKq�:e��ڎ�ݸ�y3}k�}��T��+0K��N����?@�q�\n��ȱ���s�\���`�P�o����?I��h)�V���||�@0j�*:�ѩ}Ԧ��C�+,�%��@_���v~�5�n�� W F�!�L��Ʋ��a�*b��S�P4�S\s��v�D�Ũ���!+��k����t�.����@���F��i�06�5�F�k��gv.AHuWֆ\���s;<�<�^u�K�\�l�p��7�%QGW^(��,�Q��ռ��b��j7]�y�J�P��t�+n0��y�vE$�r�q�
&ܚ�A��\'���R�ݩХp>P��wOz5�M���X���g};6Nwk��.yiA�뷯r��������6�Mq+?]�C���G�>�@}������10z�Q�qy�D}����M`�!�۸>rٳ�J�Ԯ�T���g�6�,�
�e���}��&C���J��~��f������$Sg�5���������y�C�-	u����K��=NK��ˢ�z�@�I� ��M�+�x�����󐹛^���c�d�`���8n�>ˀ�N#���Y��G�)r�Ju�P�Z�9�m�w���t����Lu���#��̕��m��+CQ_y����&hW~�.�hpG�tDWR
)�"�㡘>�]�.-�YC�G076����_P�#ӶP���Cݐ���"������6T��)1� �Sg���U��J�hQ�!G-%A���"�l+�%�x�޵�ǁjԗ��"۬&5w�(�Q��ڪ��!�sՂ<���<��%���C�HpY��W2z%g�r���at�����������)fܐטG���
E?8��W>g��/�����7��f(_�L��u����V8��;rU��#ؐ��<M�o����f�5Am�j'_iS��;�k����kQo�K�yY�e'�^D�eI�� }w�A:���Ҿm'[/��c����ǵ��#EC���hl��U#�퀹�8
�/�Bլ�n}�� 9=�A��A��yD�{�T{7ȧ�.�>�M]'�oo�g
��6�DқvY�d��'N�1�믘l��N�r�p��5�&Qǔ;�YmW)T�R;�t[�-l����u|˳�"WT���D��hP��uH��+Q7epإ.J�UŦ�wͧh}�:�d��o�[��ڧ���4�"R�}�](�K2�]H��e��\��5�o]R��Sa慐����� ����;�܇�<D��iZ_��}av_^�x��6���H��z�)�.:��Y�o}�\����>����?�e��F�	E����	���pb�+5�o�	F�zJw�m��f:�R�z�~�G������f�A�y:6��j�lc	�=��\c+m#p]@�.e�(��M�O$*�S�à5˨ˡ|�=}|�%슩S�"�Sҧ���jA�1��J�����2c\s	2����p���8���1w�5�yՁDƑA1j�����*"ķ�-UG��k�;�o�GF��o�4$�ZQ���u��~шH|ÿi�d�S�3��a,>�r4��b���< �S�Ff�SR��ŷ\��p��}g�G�E8W�ӥ�+_\ %�ϗgUhm��ӷ��:j`��O~#���&o:^e��IG����.��%�i֓��ߝr|�d���������xꔮev�d���.��wEu:F�D��О���Kd��z���c,zV ���Ϋ$�@�};�z%Rl�CT�S�ŗ~�7�"کhyt�o��e��ӔR���]R�[�!�t4Vx
����}� �ٚo;�t��u��.R�A������C�-�|6�X���ܺ�nD.�Dھ�P�1���:[���o�Z�Wk��i}��_��x�r�#n-ubGj�2/�u��m�`��|�~�	�J۔�K�@!0���ߎ�l� DP�ߜD����z \jԙH�������ԤxcEӎ�C�
�y vK�]��K�G��/�:��(A�Y<[卹1 �����/�Y�<�;�*����}����l���`��.e� '�2�`�:.e�E�k�Pn��lvm��it�E|�Ư��>T��E��1(����v�uQ��͍�	.t���h�e���裮l�����2�e\�'歐,���^�"t�a�ץ�覣����q�!��P�JYt��/����z�Fu��f�xG� "�I�m{�/�{|���8M8Sط������-�N�-��#��\��]Wa�Ԙ���,�):���Փ��^�����{Z�=k\��z����!�Y�p%IJwt�j{��K�អI)%p����8vj@��$/:��7)�����͢2O����K���MBSD�_���������q!�魠)}C��t,��YO��7 ��Vy���� ���qh��$ݯI,��W����,4�{�����{=���1��pQ��t����u)h#bKX�h[��D�\��u p����;G/�Ӳ�^
c���f���M�G�"�4�h�1� i�p���v�c}��F�@L#�&�=s�x����8*1*�״U��TU��G�����ect�2껦D�P\�Dh�S���t�WN����n
��\�l�p 7�C0.����o�V�PG�+��QV:̱�c`D��L�W��������//��=*I�����K����*�X 7   ��!�z$G�����R��'���u�>Gj��;�ǯ���c�<����~���z@�     