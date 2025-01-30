PGDMP  ,    2                 }            maquila    17.2    17.2 ~    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    17039    maquila    DATABASE     {   CREATE DATABASE maquila WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Mexico.1252';
    DROP DATABASE maquila;
                     postgres    false            �            1259    17088 	   empleados    TABLE       CREATE TABLE public.empleados (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    fk_nivel integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.empleados;
       public         heap r       postgres    false            �            1259    17087    empleados_id_seq    SEQUENCE     �   CREATE SEQUENCE public.empleados_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.empleados_id_seq;
       public               postgres    false    226            �           0    0    empleados_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.empleados_id_seq OWNED BY public.empleados.id;
          public               postgres    false    225            �            1259    17041    flujos    TABLE     �   CREATE TABLE public.flujos (
    id integer NOT NULL,
    activo boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.flujos;
       public         heap r       postgres    false            �            1259    17040    flujos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.flujos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.flujos_id_seq;
       public               postgres    false    218            �           0    0    flujos_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.flujos_id_seq OWNED BY public.flujos.id;
          public               postgres    false    217            �            1259    17116 	   licencias    TABLE     "  CREATE TABLE public.licencias (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    fk_maquina character varying(50) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.licencias;
       public         heap r       postgres    false            �            1259    17115    licencias_id_seq    SEQUENCE     �   CREATE SEQUENCE public.licencias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.licencias_id_seq;
       public               postgres    false    229            �           0    0    licencias_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.licencias_id_seq OWNED BY public.licencias.id;
          public               postgres    false    228            �            1259    17102    maquinas    TABLE     #  CREATE TABLE public.maquinas (
    no_serie character varying(50) NOT NULL,
    tipo character varying(100) NOT NULL,
    fk_flujo integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.maquinas;
       public         heap r       postgres    false            �            1259    17052 
   materiales    TABLE     �   CREATE TABLE public.materiales (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.materiales;
       public         heap r       postgres    false            �            1259    17051    materiales_id_seq    SEQUENCE     �   CREATE SEQUENCE public.materiales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.materiales_id_seq;
       public               postgres    false    220            �           0    0    materiales_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.materiales_id_seq OWNED BY public.materiales.id;
          public               postgres    false    219            �            1259    17232    materiales_productos    TABLE     �  CREATE TABLE public.materiales_productos (
    id integer NOT NULL,
    fk_material integer NOT NULL,
    fk_producto integer NOT NULL,
    cantidad integer DEFAULT 1 NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT materiales_productos_cantidad_check CHECK ((cantidad > 0))
);
 (   DROP TABLE public.materiales_productos;
       public         heap r       postgres    false            �            1259    17231    materiales_productos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.materiales_productos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.materiales_productos_id_seq;
       public               postgres    false    241            �           0    0    materiales_productos_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.materiales_productos_id_seq OWNED BY public.materiales_productos.id;
          public               postgres    false    240            �            1259    17192    metas    TABLE     @  CREATE TABLE public.metas (
    id integer NOT NULL,
    unidades integer NOT NULL,
    fk_producto integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT metas_unidades_check CHECK ((unidades > 0))
);
    DROP TABLE public.metas;
       public         heap r       postgres    false            �            1259    17191    metas_id_seq    SEQUENCE     �   CREATE SEQUENCE public.metas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.metas_id_seq;
       public               postgres    false    237            �           0    0    metas_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.metas_id_seq OWNED BY public.metas.id;
          public               postgres    false    236            �            1259    17076    niveles    TABLE       CREATE TABLE public.niveles (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    descripcion character varying(255),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.niveles;
       public         heap r       postgres    false            �            1259    17075    niveles_id_seq    SEQUENCE     �   CREATE SEQUENCE public.niveles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.niveles_id_seq;
       public               postgres    false    224            �           0    0    niveles_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.niveles_id_seq OWNED BY public.niveles.id;
          public               postgres    false    223            �            1259    17154    operadores_licencias    TABLE     :  CREATE TABLE public.operadores_licencias (
    id integer NOT NULL,
    fk_empleado integer NOT NULL,
    fk_licencia integer NOT NULL,
    fecha_expiracion date NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 (   DROP TABLE public.operadores_licencias;
       public         heap r       postgres    false            �            1259    17153    operadores_licencias_id_seq    SEQUENCE     �   CREATE SEQUENCE public.operadores_licencias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.operadores_licencias_id_seq;
       public               postgres    false    233            �           0    0    operadores_licencias_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.operadores_licencias_id_seq OWNED BY public.operadores_licencias.id;
          public               postgres    false    232            �            1259    17175    producciones    TABLE       CREATE TABLE public.producciones (
    id integer NOT NULL,
    cantidad_producto integer NOT NULL,
    fk_flujo integer NOT NULL,
    fecha date NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT producciones_cantidad_producto_check CHECK ((cantidad_producto > 0))
);
     DROP TABLE public.producciones;
       public         heap r       postgres    false            �            1259    17208    producciones_detalles    TABLE     �  CREATE TABLE public.producciones_detalles (
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
       public         heap r       postgres    false            �            1259    17207    producciones_detalles_id_seq    SEQUENCE     �   CREATE SEQUENCE public.producciones_detalles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.producciones_detalles_id_seq;
       public               postgres    false    239            �           0    0    producciones_detalles_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.producciones_detalles_id_seq OWNED BY public.producciones_detalles.id;
          public               postgres    false    238            �            1259    17174    producciones_id_seq    SEQUENCE     �   CREATE SEQUENCE public.producciones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.producciones_id_seq;
       public               postgres    false    235            �           0    0    producciones_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.producciones_id_seq OWNED BY public.producciones.id;
          public               postgres    false    234            �            1259    17064 	   productos    TABLE     �   CREATE TABLE public.productos (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.productos;
       public         heap r       postgres    false            �            1259    17133    productos_flujos    TABLE       CREATE TABLE public.productos_flujos (
    id integer NOT NULL,
    fk_producto integer NOT NULL,
    fk_flujo integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 $   DROP TABLE public.productos_flujos;
       public         heap r       postgres    false            �            1259    17132    productos_flujos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.productos_flujos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.productos_flujos_id_seq;
       public               postgres    false    231            �           0    0    productos_flujos_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.productos_flujos_id_seq OWNED BY public.productos_flujos.id;
          public               postgres    false    230            �            1259    17063    productos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.productos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.productos_id_seq;
       public               postgres    false    222            �           0    0    productos_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.productos_id_seq OWNED BY public.productos.id;
          public               postgres    false    221            �           2604    17091    empleados id    DEFAULT     l   ALTER TABLE ONLY public.empleados ALTER COLUMN id SET DEFAULT nextval('public.empleados_id_seq'::regclass);
 ;   ALTER TABLE public.empleados ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    226    225    226            �           2604    17044 	   flujos id    DEFAULT     f   ALTER TABLE ONLY public.flujos ALTER COLUMN id SET DEFAULT nextval('public.flujos_id_seq'::regclass);
 8   ALTER TABLE public.flujos ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    218    217    218            �           2604    17119    licencias id    DEFAULT     l   ALTER TABLE ONLY public.licencias ALTER COLUMN id SET DEFAULT nextval('public.licencias_id_seq'::regclass);
 ;   ALTER TABLE public.licencias ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    228    229    229            �           2604    17055    materiales id    DEFAULT     n   ALTER TABLE ONLY public.materiales ALTER COLUMN id SET DEFAULT nextval('public.materiales_id_seq'::regclass);
 <   ALTER TABLE public.materiales ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    219    220    220            �           2604    17235    materiales_productos id    DEFAULT     �   ALTER TABLE ONLY public.materiales_productos ALTER COLUMN id SET DEFAULT nextval('public.materiales_productos_id_seq'::regclass);
 F   ALTER TABLE public.materiales_productos ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    241    240    241            �           2604    17195    metas id    DEFAULT     d   ALTER TABLE ONLY public.metas ALTER COLUMN id SET DEFAULT nextval('public.metas_id_seq'::regclass);
 7   ALTER TABLE public.metas ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    237    236    237            �           2604    17079 
   niveles id    DEFAULT     h   ALTER TABLE ONLY public.niveles ALTER COLUMN id SET DEFAULT nextval('public.niveles_id_seq'::regclass);
 9   ALTER TABLE public.niveles ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    223    224    224            �           2604    17157    operadores_licencias id    DEFAULT     �   ALTER TABLE ONLY public.operadores_licencias ALTER COLUMN id SET DEFAULT nextval('public.operadores_licencias_id_seq'::regclass);
 F   ALTER TABLE public.operadores_licencias ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    232    233    233            �           2604    17178    producciones id    DEFAULT     r   ALTER TABLE ONLY public.producciones ALTER COLUMN id SET DEFAULT nextval('public.producciones_id_seq'::regclass);
 >   ALTER TABLE public.producciones ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    235    234    235            �           2604    17211    producciones_detalles id    DEFAULT     �   ALTER TABLE ONLY public.producciones_detalles ALTER COLUMN id SET DEFAULT nextval('public.producciones_detalles_id_seq'::regclass);
 G   ALTER TABLE public.producciones_detalles ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    238    239    239            �           2604    17067    productos id    DEFAULT     l   ALTER TABLE ONLY public.productos ALTER COLUMN id SET DEFAULT nextval('public.productos_id_seq'::regclass);
 ;   ALTER TABLE public.productos ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    222    221    222            �           2604    17136    productos_flujos id    DEFAULT     z   ALTER TABLE ONLY public.productos_flujos ALTER COLUMN id SET DEFAULT nextval('public.productos_flujos_id_seq'::regclass);
 B   ALTER TABLE public.productos_flujos ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    230    231    231            �          0    17088 	   empleados 
   TABLE DATA           Q   COPY public.empleados (id, nombre, fk_nivel, created_at, updated_at) FROM stdin;
    public               postgres    false    226   7�       �          0    17041    flujos 
   TABLE DATA           D   COPY public.flujos (id, activo, created_at, updated_at) FROM stdin;
    public               postgres    false    218   �       �          0    17116 	   licencias 
   TABLE DATA           S   COPY public.licencias (id, nombre, fk_maquina, created_at, updated_at) FROM stdin;
    public               postgres    false    229   ƾ       �          0    17102    maquinas 
   TABLE DATA           T   COPY public.maquinas (no_serie, tipo, fk_flujo, created_at, updated_at) FROM stdin;
    public               postgres    false    227   o�       �          0    17052 
   materiales 
   TABLE DATA           H   COPY public.materiales (id, nombre, created_at, updated_at) FROM stdin;
    public               postgres    false    220   `�       �          0    17232    materiales_productos 
   TABLE DATA           n   COPY public.materiales_productos (id, fk_material, fk_producto, cantidad, created_at, updated_at) FROM stdin;
    public               postgres    false    241         �          0    17192    metas 
   TABLE DATA           R   COPY public.metas (id, unidades, fk_producto, created_at, updated_at) FROM stdin;
    public               postgres    false    237   �,      �          0    17076    niveles 
   TABLE DATA           R   COPY public.niveles (id, nombre, descripcion, created_at, updated_at) FROM stdin;
    public               postgres    false    224   �Q      �          0    17154    operadores_licencias 
   TABLE DATA           v   COPY public.operadores_licencias (id, fk_empleado, fk_licencia, fecha_expiracion, created_at, updated_at) FROM stdin;
    public               postgres    false    233   #S      �          0    17175    producciones 
   TABLE DATA           f   COPY public.producciones (id, cantidad_producto, fk_flujo, fecha, created_at, updated_at) FROM stdin;
    public               postgres    false    235   �}      �          0    17208    producciones_detalles 
   TABLE DATA           {   COPY public.producciones_detalles (id, fk_produccion, fk_meta, cumplio, tiempo_muerto, created_at, updated_at) FROM stdin;
    public               postgres    false    239   ��      �          0    17064 	   productos 
   TABLE DATA           G   COPY public.productos (id, nombre, created_at, updated_at) FROM stdin;
    public               postgres    false    222   ��      �          0    17133    productos_flujos 
   TABLE DATA           ]   COPY public.productos_flujos (id, fk_producto, fk_flujo, created_at, updated_at) FROM stdin;
    public               postgres    false    231   ��      �           0    0    empleados_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.empleados_id_seq', 1, false);
          public               postgres    false    225            �           0    0    flujos_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.flujos_id_seq', 1, false);
          public               postgres    false    217            �           0    0    licencias_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.licencias_id_seq', 1, false);
          public               postgres    false    228            �           0    0    materiales_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.materiales_id_seq', 1, false);
          public               postgres    false    219            �           0    0    materiales_productos_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.materiales_productos_id_seq', 1, false);
          public               postgres    false    240            �           0    0    metas_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.metas_id_seq', 1, false);
          public               postgres    false    236            �           0    0    niveles_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.niveles_id_seq', 1, false);
          public               postgres    false    223            �           0    0    operadores_licencias_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.operadores_licencias_id_seq', 1, false);
          public               postgres    false    232            �           0    0    producciones_detalles_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.producciones_detalles_id_seq', 1, false);
          public               postgres    false    238            �           0    0    producciones_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.producciones_id_seq', 1, false);
          public               postgres    false    234            �           0    0    productos_flujos_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.productos_flujos_id_seq', 1, false);
          public               postgres    false    230            �           0    0    productos_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.productos_id_seq', 1, false);
          public               postgres    false    221            �           2606    17095    empleados empleados_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.empleados
    ADD CONSTRAINT empleados_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.empleados DROP CONSTRAINT empleados_pkey;
       public                 postgres    false    226            �           2606    17049    flujos flujos_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.flujos
    ADD CONSTRAINT flujos_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.flujos DROP CONSTRAINT flujos_pkey;
       public                 postgres    false    218            �           2606    17125    licencias licencias_nombre_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.licencias
    ADD CONSTRAINT licencias_nombre_key UNIQUE (nombre);
 H   ALTER TABLE ONLY public.licencias DROP CONSTRAINT licencias_nombre_key;
       public                 postgres    false    229            �           2606    17123    licencias licencias_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.licencias
    ADD CONSTRAINT licencias_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.licencias DROP CONSTRAINT licencias_pkey;
       public                 postgres    false    229            �           2606    17108    maquinas maquinas_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.maquinas
    ADD CONSTRAINT maquinas_pkey PRIMARY KEY (no_serie);
 @   ALTER TABLE ONLY public.maquinas DROP CONSTRAINT maquinas_pkey;
       public                 postgres    false    227            �           2606    17061     materiales materiales_nombre_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.materiales
    ADD CONSTRAINT materiales_nombre_key UNIQUE (nombre);
 J   ALTER TABLE ONLY public.materiales DROP CONSTRAINT materiales_nombre_key;
       public                 postgres    false    220            �           2606    17059    materiales materiales_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.materiales
    ADD CONSTRAINT materiales_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.materiales DROP CONSTRAINT materiales_pkey;
       public                 postgres    false    220            �           2606    17241 .   materiales_productos materiales_productos_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.materiales_productos
    ADD CONSTRAINT materiales_productos_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.materiales_productos DROP CONSTRAINT materiales_productos_pkey;
       public                 postgres    false    241            �           2606    17200    metas metas_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.metas
    ADD CONSTRAINT metas_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.metas DROP CONSTRAINT metas_pkey;
       public                 postgres    false    237            �           2606    17085    niveles niveles_nombre_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.niveles
    ADD CONSTRAINT niveles_nombre_key UNIQUE (nombre);
 D   ALTER TABLE ONLY public.niveles DROP CONSTRAINT niveles_nombre_key;
       public                 postgres    false    224            �           2606    17083    niveles niveles_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.niveles
    ADD CONSTRAINT niveles_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.niveles DROP CONSTRAINT niveles_pkey;
       public                 postgres    false    224            �           2606    17161 .   operadores_licencias operadores_licencias_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.operadores_licencias
    ADD CONSTRAINT operadores_licencias_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.operadores_licencias DROP CONSTRAINT operadores_licencias_pkey;
       public                 postgres    false    233            �           2606    17218 0   producciones_detalles producciones_detalles_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.producciones_detalles
    ADD CONSTRAINT producciones_detalles_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.producciones_detalles DROP CONSTRAINT producciones_detalles_pkey;
       public                 postgres    false    239            �           2606    17183    producciones producciones_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.producciones
    ADD CONSTRAINT producciones_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.producciones DROP CONSTRAINT producciones_pkey;
       public                 postgres    false    235            �           2606    17140 &   productos_flujos productos_flujos_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.productos_flujos
    ADD CONSTRAINT productos_flujos_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.productos_flujos DROP CONSTRAINT productos_flujos_pkey;
       public                 postgres    false    231            �           2606    17073    productos productos_nombre_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_nombre_key UNIQUE (nombre);
 H   ALTER TABLE ONLY public.productos DROP CONSTRAINT productos_nombre_key;
       public                 postgres    false    222            �           2606    17071    productos productos_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.productos DROP CONSTRAINT productos_pkey;
       public                 postgres    false    222            �           1259    17101    idx_empleados_nombre    INDEX     L   CREATE INDEX idx_empleados_nombre ON public.empleados USING btree (nombre);
 (   DROP INDEX public.idx_empleados_nombre;
       public                 postgres    false    226            �           1259    17050    idx_flujos_activo    INDEX     F   CREATE INDEX idx_flujos_activo ON public.flujos USING btree (activo);
 %   DROP INDEX public.idx_flujos_activo;
       public                 postgres    false    218            �           1259    17131    idx_licencias_nombre    INDEX     L   CREATE INDEX idx_licencias_nombre ON public.licencias USING btree (nombre);
 (   DROP INDEX public.idx_licencias_nombre;
       public                 postgres    false    229            �           1259    17114    idx_maquinas_tipo    INDEX     F   CREATE INDEX idx_maquinas_tipo ON public.maquinas USING btree (tipo);
 %   DROP INDEX public.idx_maquinas_tipo;
       public                 postgres    false    227            �           1259    17062    idx_materiales_nombre    INDEX     N   CREATE INDEX idx_materiales_nombre ON public.materiales USING btree (nombre);
 )   DROP INDEX public.idx_materiales_nombre;
       public                 postgres    false    220            �           1259    17252 !   idx_materiales_productos_material    INDEX     i   CREATE INDEX idx_materiales_productos_material ON public.materiales_productos USING btree (fk_material);
 5   DROP INDEX public.idx_materiales_productos_material;
       public                 postgres    false    241            �           1259    17253 !   idx_materiales_productos_producto    INDEX     i   CREATE INDEX idx_materiales_productos_producto ON public.materiales_productos USING btree (fk_producto);
 5   DROP INDEX public.idx_materiales_productos_producto;
       public                 postgres    false    241            �           1259    17206    idx_metas_producto    INDEX     K   CREATE INDEX idx_metas_producto ON public.metas USING btree (fk_producto);
 &   DROP INDEX public.idx_metas_producto;
       public                 postgres    false    237            �           1259    17086    idx_niveles_nombre    INDEX     H   CREATE INDEX idx_niveles_nombre ON public.niveles USING btree (nombre);
 &   DROP INDEX public.idx_niveles_nombre;
       public                 postgres    false    224            �           1259    17172 !   idx_operadores_licencias_empleado    INDEX     i   CREATE INDEX idx_operadores_licencias_empleado ON public.operadores_licencias USING btree (fk_empleado);
 5   DROP INDEX public.idx_operadores_licencias_empleado;
       public                 postgres    false    233            �           1259    17173 !   idx_operadores_licencias_licencia    INDEX     i   CREATE INDEX idx_operadores_licencias_licencia ON public.operadores_licencias USING btree (fk_licencia);
 5   DROP INDEX public.idx_operadores_licencias_licencia;
       public                 postgres    false    233            �           1259    17230    idx_producciones_detalles_meta    INDEX     c   CREATE INDEX idx_producciones_detalles_meta ON public.producciones_detalles USING btree (fk_meta);
 2   DROP INDEX public.idx_producciones_detalles_meta;
       public                 postgres    false    239            �           1259    17229 $   idx_producciones_detalles_produccion    INDEX     o   CREATE INDEX idx_producciones_detalles_produccion ON public.producciones_detalles USING btree (fk_produccion);
 8   DROP INDEX public.idx_producciones_detalles_produccion;
       public                 postgres    false    239            �           1259    17190    idx_producciones_fecha    INDEX     P   CREATE INDEX idx_producciones_fecha ON public.producciones USING btree (fecha);
 *   DROP INDEX public.idx_producciones_fecha;
       public                 postgres    false    235            �           1259    17189    idx_producciones_flujo    INDEX     S   CREATE INDEX idx_producciones_flujo ON public.producciones USING btree (fk_flujo);
 *   DROP INDEX public.idx_producciones_flujo;
       public                 postgres    false    235            �           1259    17152    idx_productos_flujos_flujo    INDEX     [   CREATE INDEX idx_productos_flujos_flujo ON public.productos_flujos USING btree (fk_flujo);
 .   DROP INDEX public.idx_productos_flujos_flujo;
       public                 postgres    false    231            �           1259    17151    idx_productos_flujos_producto    INDEX     a   CREATE INDEX idx_productos_flujos_producto ON public.productos_flujos USING btree (fk_producto);
 1   DROP INDEX public.idx_productos_flujos_producto;
       public                 postgres    false    231            �           1259    17074    idx_productos_nombre    INDEX     L   CREATE INDEX idx_productos_nombre ON public.productos USING btree (nombre);
 (   DROP INDEX public.idx_productos_nombre;
       public                 postgres    false    222            �           2606    17096    empleados fk_empleado_nivel    FK CONSTRAINT     }   ALTER TABLE ONLY public.empleados
    ADD CONSTRAINT fk_empleado_nivel FOREIGN KEY (fk_nivel) REFERENCES public.niveles(id);
 E   ALTER TABLE ONLY public.empleados DROP CONSTRAINT fk_empleado_nivel;
       public               postgres    false    224    226    4817            �           2606    17126    licencias fk_licencia_maquina    FK CONSTRAINT     �   ALTER TABLE ONLY public.licencias
    ADD CONSTRAINT fk_licencia_maquina FOREIGN KEY (fk_maquina) REFERENCES public.maquinas(no_serie);
 G   ALTER TABLE ONLY public.licencias DROP CONSTRAINT fk_licencia_maquina;
       public               postgres    false    229    4823    227            �           2606    17109    maquinas fk_maquina_flujo    FK CONSTRAINT     z   ALTER TABLE ONLY public.maquinas
    ADD CONSTRAINT fk_maquina_flujo FOREIGN KEY (fk_flujo) REFERENCES public.flujos(id);
 C   ALTER TABLE ONLY public.maquinas DROP CONSTRAINT fk_maquina_flujo;
       public               postgres    false    227    218    4801            �           2606    17242 2   materiales_productos fk_material_producto_material    FK CONSTRAINT     �   ALTER TABLE ONLY public.materiales_productos
    ADD CONSTRAINT fk_material_producto_material FOREIGN KEY (fk_material) REFERENCES public.materiales(id);
 \   ALTER TABLE ONLY public.materiales_productos DROP CONSTRAINT fk_material_producto_material;
       public               postgres    false    241    4807    220                        2606    17247 2   materiales_productos fk_material_producto_producto    FK CONSTRAINT     �   ALTER TABLE ONLY public.materiales_productos
    ADD CONSTRAINT fk_material_producto_producto FOREIGN KEY (fk_producto) REFERENCES public.productos(id);
 \   ALTER TABLE ONLY public.materiales_productos DROP CONSTRAINT fk_material_producto_producto;
       public               postgres    false    4812    241    222            �           2606    17201    metas fk_meta_producto    FK CONSTRAINT     }   ALTER TABLE ONLY public.metas
    ADD CONSTRAINT fk_meta_producto FOREIGN KEY (fk_producto) REFERENCES public.productos(id);
 @   ALTER TABLE ONLY public.metas DROP CONSTRAINT fk_meta_producto;
       public               postgres    false    237    222    4812            �           2606    17162 2   operadores_licencias fk_operador_licencia_empleado    FK CONSTRAINT     �   ALTER TABLE ONLY public.operadores_licencias
    ADD CONSTRAINT fk_operador_licencia_empleado FOREIGN KEY (fk_empleado) REFERENCES public.empleados(id);
 \   ALTER TABLE ONLY public.operadores_licencias DROP CONSTRAINT fk_operador_licencia_empleado;
       public               postgres    false    233    226    4819            �           2606    17167 2   operadores_licencias fk_operador_licencia_licencia    FK CONSTRAINT     �   ALTER TABLE ONLY public.operadores_licencias
    ADD CONSTRAINT fk_operador_licencia_licencia FOREIGN KEY (fk_licencia) REFERENCES public.licencias(id);
 \   ALTER TABLE ONLY public.operadores_licencias DROP CONSTRAINT fk_operador_licencia_licencia;
       public               postgres    false    229    233    4828            �           2606    17224 0   producciones_detalles fk_produccion_detalle_meta    FK CONSTRAINT     �   ALTER TABLE ONLY public.producciones_detalles
    ADD CONSTRAINT fk_produccion_detalle_meta FOREIGN KEY (fk_meta) REFERENCES public.metas(id);
 Z   ALTER TABLE ONLY public.producciones_detalles DROP CONSTRAINT fk_produccion_detalle_meta;
       public               postgres    false    237    239    4843            �           2606    17219 6   producciones_detalles fk_produccion_detalle_produccion    FK CONSTRAINT     �   ALTER TABLE ONLY public.producciones_detalles
    ADD CONSTRAINT fk_produccion_detalle_produccion FOREIGN KEY (fk_produccion) REFERENCES public.producciones(id);
 `   ALTER TABLE ONLY public.producciones_detalles DROP CONSTRAINT fk_produccion_detalle_produccion;
       public               postgres    false    239    4840    235            �           2606    17184     producciones fk_produccion_flujo    FK CONSTRAINT     �   ALTER TABLE ONLY public.producciones
    ADD CONSTRAINT fk_produccion_flujo FOREIGN KEY (fk_flujo) REFERENCES public.flujos(id);
 J   ALTER TABLE ONLY public.producciones DROP CONSTRAINT fk_produccion_flujo;
       public               postgres    false    4801    218    235            �           2606    17146 (   productos_flujos fk_producto_flujo_flujo    FK CONSTRAINT     �   ALTER TABLE ONLY public.productos_flujos
    ADD CONSTRAINT fk_producto_flujo_flujo FOREIGN KEY (fk_flujo) REFERENCES public.flujos(id);
 R   ALTER TABLE ONLY public.productos_flujos DROP CONSTRAINT fk_producto_flujo_flujo;
       public               postgres    false    4801    231    218            �           2606    17141 +   productos_flujos fk_producto_flujo_producto    FK CONSTRAINT     �   ALTER TABLE ONLY public.productos_flujos
    ADD CONSTRAINT fk_producto_flujo_producto FOREIGN KEY (fk_producto) REFERENCES public.productos(id);
 U   ALTER TABLE ONLY public.productos_flujos DROP CONSTRAINT fk_producto_flujo_producto;
       public               postgres    false    231    4812    222            �      x���K��ʎ]�g��8�?IY�^0H�ld�����R��.p+�`Ǖ�4�7���Ͽ�������?����q�Gʟr���(����o����v�������i�#��Y�{�����"e�M��m9��D�����uwˆ��\ߦ��"h:���[�E;��?ҿ?+��l*�fvӁ��Oտ�?�[yѢ�����6���M��7����6=>�w�|s�M�����^��j��S�ö�j|�:�=�>��e�
�N3����w���b�$p�T�z�·��?V঩�XFm�E[�i�yׯ��r����J��7�N�]���CM�x�����÷O��j;����������zz��i;ܯ���'OM��k*��n,5U�:�����܋��������|,IS�
5������@/k�^���w����$���0Mᨩ��v��_u���0�TR����S��)p�T���wq�~[�GM�t��sݞ���KM5��;^�^�m�-,5՚A��M��;~*<5������x���
SM����t�O�����j΍q���Sa���+����m᪩��#�ڂO
���}_F��[=���TSɞn����vʬ0�T�N�g2��2L5�����6����J�<W�u}��TS�z�qD����j����)�M���������g��SMu�n�nð�����[6��bO����>� ��\���z�����3����SS�ee7N=S��r���Z�n/�ga��a��j6f��O���ZC�xK}�l-�a��S��2O��RS��������*��RS�i��1����ux�����y�~��g��a����&�2��ov��a�>����n�������7�A���TS���Sڗ��S��l�{�@f�8੩�<5W�;3�Xj*��������(f�p����}����K�`
��9j|�gh�]�U����TkH���}������1T6��X^j�wE��e?[j�Zj�Ք��x|?p�Tr���d[M3L���T��?-�</l�Nxj*�V>�����9ᩩ~�����s�Sg]oH�����0�����zq�� �hq�Tg_�
��ý]]Nc�0�T�m��}�;m�0�T�2��e�<᪩�J�����p�Tfm�M���\p�T�^���O�fd�`�K��~�G�Y=�%�S]_S�j�¨|�TW]Ck�]��ܱy�<5�읁[�<m��TS��Τm����SM�׾%���OM%mu��)�/xj��l��5O�2������A�c�������NpƦv���{�2����}�����_)��M��ᨩ ��Kݰ����nE�7}��75�Y�J2ѣ-uo�)��<Ӱ}?p�T��S�-JhG���a��;��KM�(D�K����rXS��~k����r���1�dWAC�Qж��q�׫�l��h����dD��������0�x�
.�Ѹ�K\S�:mڎua	+���[>|�h|��z���!�m/��i��|֟o�F�{-{/�����tUO��L�q�{�5�����8l�@fcxK6�
ۿÓ5OW�ܵ2C���b�\S�a�?j�����w�}���R��R�k��2;s���g�ڶ�gY�g��p�R��ؘ��˽'�K��lK���Ԁ��2Ӓg�ޚ ��2Hdd]U_F��S@�U�u�G����$@��Z�g��ѳ-�5U���d����5��ز%������~��:l]�1a}��N\W��J��6�4�*)�Ǻ-ݳ��]W�NN����G��J�3�3]Y{���z�d��s�)�����J�1��`;���z����[��X��:lt�]�kz�Ovc ��u���N�y^�]���Y1p
�.~�]��B�1��gW�N�T��18��w���dc�gW%}��%ِ�� ���ܫ��`�k���7�e�خ�N?�y7��\S�А@nw�0W�IsX�4� ����X���nnA�# �^���Z�?�]��YB�!��Y�]՚��^ Nm`�^���� �6�տ�bFъ?i@wU�n2�b�		�O�����"���e;����J��a��ꝒkBҪ{Q�W�cWxO�Ƴ{W���"������������ON)�u.s���X�7���v�W�f�ه� �Ĭ2��+�\c������ae6����gIn��� �W������鳏��W��֬/�|O�����L�w����K�D�-�5սn:�y�0��\�7T�a��J��%pxU��m�wcqPr6���qe��Cc�k���#@�����z_1��zs�%P���F�8�u��ū��^��؍`��z�q�)|X���b�0^�쳖pFJ�;�[���Y����C �U��T���NW�ȫ*f"
Q3�#���wZ�Vio�� �U��$�-��5�u]�d'��]���`,�7��e1��*�T̎ �T0��a��qڵ*�: h^�� �9�!4�J�b/t��K.�yU}=�84�&ؼ*�aF%\�mr�U��^�M�́ΫzV\O K�x1xM��UɶG8��/��d��d��V�W��g(�,Pmp"𼪗T���Tж�mY�Fgr6}3�x^���IX}��i�/����Xn�_�Ѹ��;q�I� Ыz���Ļ��ϫ�����y]hl��ݏ��Q���B����D��Ď��D�J�"�(k���(���s�B���W��/Lm�^U��8D;���^�&O������$K�ï�}Y�>�uCH�W��!�7���K�ư�zcb�R�Æ��z�a.ߡ�C#?�^ջ�Еp@ְ�lwM�N���'��}�`��e��u�5�X&P��U�}ȑ�5�M@zU&$��ѓ�U�a �"�,����L
�Xhl`��B�%Mfr��N��ܽ'����L��~�/ٞŅ}����nw�<�9��&
0���,\�&W܅a.��;['�Pnz�WeN��yu�ᮩ��ZW� &6���� ��;�_��ưW�e�h��5�����o�ŵu�W����q���N��] �Ԩ��pzU+�����REfcث���0x=�f� ��,�
�lR��ph+��϶�W3�!���=@��u�r%S���{iX���@�U��I�z��^�Q2�޹��Wշ��2�E�pzUkr%��J�^�j�*ZB��U�����l� ӗ�3����'`zU��m>��シz�y���.�����-��Q�ls���A�~Ը0�5�B�#9
vU`zUo�[{��ӫz)J8����kpzU�W|Y�/w����8��.8���M�b��L�zU+�&�]��=�^��5>Q�I`%V ��֋
W>�o��ƹך!��Yx!��ך���"
@�*�ON"�2�W�����$�P_V���-\���^ղH֣�V��U�=��CY�Aa�/g3�a]ϐ���:���lz6���m/.�׀mO(X���+�伎�'�^Պ���d�	�zU�S����E
`���^�X�L�^�Z.&�_<���a�E�Ζ5�1�u��QgQ�md��l{)�/����A8 Z�J�q_�*��U@�U���B�뎀���7C�Z���h��=�h�zU��ŀ��[��U�s�x�4���W����(r�W�RB�/�0�`�^��<@�Z���X�$ޝ� {U��:�N���W��^!D�ILã��V8}M��?W) ��֒�LRh��2�u�;�*t��4*��*s�Aǯ
d�jƸcepz�W%�\1��rm+�ֽa	"��@��^��Sq�b��h��b"_������K�5�h�^Gr��,�lv?�������p]�����.>j {U�U�(n:+x�*3M�	���ޒ����ғ+���wWՇ�W {UkB!����
`_���4(�:�^ջl��Lw>=�]���̙�k�K��� ��̶0���|��V�^��j�i�Ho�ma��TM��%>ѫ�֫���� �3��[J�7?XGL\�*���v�
Z���Y#�*`��]Q+.�ԅ
V�jG�d;F>,8k�w�'��q��Κj    ��Ġx�W�zU}=�B�؅�ƪbsѳ�y@����1�"����
T��&���Wk�^յ�����֪}�A�`U�U�$��i��k���cJ^�8���aż���gcx덧ϲx�+8�*�Cm
n��W��r�w�ᆲ��j;���=�C�
N��>j��2܅��L\{D�<<�����(�#�m�6��%��d2�\P��]��.�d���2�?�> ����p$RèP�Ꝛ�WF;VpzU�����UpzU�[V��7o��g�#{�L�j,��@ZF�V`zU�����9��ҫ�����=�W@zU�Vd�$��SPzU�q�]͞
J_�`z�B����H��,�c�;�E+(�*S-�,;O��M�,]¦�E-*(��5܆t��WPzU���}�������6��͚�0t�ҫz�g�S\����Z����^�r�a��L5�����M�]�6)1`�q��W������u��H�jŃ��,a�H�j�+�>@e�`���i��G�a�ss�����lw��t�t������]�f�����w�=��n�:�����6̶0׉���6� ���y@�9��WzU+�<�^?�V��A�U��\q~Z�W�����R��B��߻q��^��C�s��I+ ��w�Ւ"��+$	o]��!b�P�	H|^�����14�ϫZ�t-)yr����N�����G�W�yU&Y=t�Ot^ծ�ؚK����V	�����{��1�5UY�5��쬠����?��������:9x^ծ��?.������0��U&�|]�n<�Kw�p�-8ߒ=�/�5�� ���mN�yU&&#��X䪁Ϋ��(!@���輪��w��Nt^�Z���\)C�|;l�u䘬��@�U�=��g��:ߎ�V����Qx^�	��r���Ϸ�||��T�*[�;l�XX���7)���˓}x���3�*��7�yU�nU��.��ϫ�%*â˝f4�yU��U�F���7[�����\��.Y�@�x�x�ր�츈h���5����� ���4��\E��yR��%�5�yU+�䈍�� ��[L�籬�ҮQ����7W?�\T���J��cr���@�ʄ���LWn�Ы��|˒p7�@�U��Y�����m>"�EV~l ����:��P��^���Ŕ�U5 zU�D"l�����U�-nWy�ưVmv�ORy�� �U�������5�>,��<@�j#�X��Ś ���g�JSc&�W%�xC��h���^չj,��n|^��a�9<4n����~��n��We� �c6$����V{�U�/�Ǝ� ��^�{�ubq�ܳ-��V#���r�)��*�G���j|�->_�d	~m��ϫ2�+-!g�5 }[%揤nf\��Ы�{�8��LO�W�j������������r�-��w���C�v�We�s�-w��^��x%;>�N�ư�2����a��`���p�O��3fc��5/L����&}{ވ���3�����Ȅ�������uv�D�����U�A3~X����^����İ�B����$�]�^�	zIR�� zU�ړO'\�a�qmp�Ҕ:����Q􏍲���� ���㌬��� ��d��qU��^���t��� �*S.8�5��7�yUm�Ęez����N�{��� �*󥊰nb�i�W�w]�a� �yUo���+cx|^�Zse!d��< ����.I�$ޜm�k1��~� �W�k����Fk�ϫ2�Ԇ��x^ժ�p�:0�ϫ�Wu��ۀ�U�e���5�u��Ǥm	� zU;�<��t�ЫzwNW�}on���U�s��b'>�j��Jם��۽�>����We�>��h ��*[�!�W~ծЫz�0wn�v�  ��~��>�>���O+9��>�V��'x�Fn6�������5�������UɺF\p�ϫ�qՑp��A�U�9�N�"2Q�����t q%�;𼪲o1���oU�ϫ2yđb���M��Y��^ՊIR��^ ���#g��(|^�R�Ĉg0x����A�3,.2d���D�yx�Lx���4z�ר��ϻ:�*3���mW��+|�Hf�gi�<����'e�����=��W_;�ϫڟh�eA�{��|��U���ӂ��^�(9kw��t^�A 1���<�ʖHξ|�+�]e� ��pwma�Rm��0�
pw��^V��49����̕���:��T�3����|7�{�G����^�����g���:��\�{�!<R|��>�j[�n�mW�W���H>í}� ���=[��:�5t zU��)&m|� ��L�8�3��Ыz�$�w�p�F���D���B��d�$�&�����O�C~?��Ы�^Pʪ��^�)W�u���@��~�y�D�D�j�<GDϵq�W��Z�{M��D�W�qy{�h� ��Jݔ$X�W���a�6�"�S@����	�#�9�=��`��L�B
W�@��̗�b�O�;��u�V�bn��Wu/�9�-��U���P���rY�^Ջ�B�������A�O\f��u�' zUb��:b�Gsu|=;?�x\0W?M1�XЈ�����꒐�U}�p�W����m�y�A�U���$��LzU+�?��W�m�A�U��d~�����wE��J�:w zUk��I�9Qh�We2b�z�A��U-�b`ť���p�x#�|���}�� (�*��vr����LjZ�`�X�L�׷a����
�����q ���3�;(�*3��S٪J��-�w�%T`/PzUbRĒ �5�uv����NF\P��)�/�|Mp�y�¿!A�U����̧�c�^��wpzU��G�3����We�˲���6�u�-�����qӫZ_�z->Ψ����ӗ��R(S���U�ۉHR}�s����A8�8���a�k����JgvpzU�[ٶ���v`zU� ��_:��ӫzG����Kl����F}���8}7�>�|�/����U�������Yԫz�:$ �5�-ܥ�~W�,�Շ� ��6�ʲ����.�ߡhq��
r�^���"�]��H}7�>�]Lz���M�?����^���v2�ط<��U�q +H��m����4�9�:lۊ��CfG�a;� �W��f�k������oj76�+[c�zUe=��Qۗ<@�-tjR_r�ԏce1}wh��mo����8�R�j�cH���!���g���T?�~�8��7H�*V�@Ac�KL��,�t�a.�(k�`s�s�0#nLb.�Y�\�KF\1�ɝ��zU��1���P�����X�V�jg�ă����^�Yx �v"�^UY�_[`�R��T�	L��R�j�4F�����J���ia$���-��Y�x�ms�E��cU����Q��ʊ�T���zKݴ���P?�).L���o�ԫ2�c�2A�	�?�o�-�U����������`��Z�a� �We�y ~��>,:@�U�x��s�ԫ�_K����Z7����jT��pW]i� !�y�ԫZ��N��R��-�d�j,P �cդϿ ��H�*��8/2�`�ԫZ�P��J9�k{53/�-�X��	R�J�HR�01��C�C{��0@�U�ey��J�^���}ź�/�~�����n!�t ի2�YȲ�P��]�%.�*�l �c�Ǭ�`�mᮾS5bU�v���m�WXh���T��(�*�5����=�M,��ưW7D")��`���ӓ�W_�f �UY��
h���~P�����֫�}��f�ہ �^���+��zU�C���G���h�x#���{u����a�]��#�	@�U�OA�u=?�4 �U]k若�����ƽ㕒�J.Ns�Տ���~��� �We�����E�V��=�O�hv�W���zr��B=�~��Fh��&n�T?v�&����zU&&-�dW�`��lu��Dn\z�ի�'%�+�dc ի�0#r�o@�U�e�H��3@�ǅO_'����WezqV�sH����u�Q�;(�zU& �   x'��xj?��ǵ�-	�'n�~��7y�\uԏU��%�?� � �W�&հ�x<��o]�^�^�2�Ҙ@��V�oI��%P��U2+���2�P��,5*;���[���Ĥ�T�j�y��}S@��^�*��D�T�JvQ������u�1[��'�_�e���Dy�6�u߻L�/G�N�zU�-�>"5��������?�P      �   �   x�]��C1DϦ�4@Ā��Ԓs*H�
���I>��0����b��y��]�44��m:X"#oll��Zg]/���>�Y�<��*X����d��[�kc��]�)����l^X��b�Pzg�/�읩���M�v�mz�zKHa-���47^C��D�*Q      �      x�������n�뻞"/�S�d;]��H .R�����D�#5� �8g0���/��GR��߿���������㐿������C�֎�������q��������a���j0о��5`�	ǟ��iwPЯ�޾�,��?my��� �_��G��
��0�a��W�_~�ڑ<�$_v}w�9�l����^'�_b�A�c�k߁�ϛ����
��B������c��̯ �1X>�����>��y����%�bA`aj�x[�����?V�@�2�h��#�Q�o�|I�e���>h[9/b�Q�����c��O���}	�(_=ʔ�3�r&"��^A����sQ��[�� E�+������+��y��$)S�G|�cd�� M�=���H�ز(�A�mj�|u["��my�M��I��3����Y�Р���}��|���xT��4���VT�����3@�mjRN��vշXחM��F����������A�mj�|f����e�l�d;�N���q�g�Y��q�&���ݿ�}f=y�m�d����;���#}��B�z`�շ��pc�UhR�&o��Ž*8֭E�
M�������q�XX�A�I��<�+���ފZv��B�:5ن�G����4�S��M���U�
M����>�R6����&����޹e��ݰ�)4��Ⳛ�N�K�IuM6_폼F%ΠI���e��6�bY�����sY�ʷ0(ʠIk��'.���eФ����$���u�4h�k�g$5�E��`Ф�/�+kԍUΠI����Ė��BM��d�q/k���A�65y5׃�S�IEA�65���Ķ�Z�|��Mv߻o�����V�C�}j�͕��΋u���d��T�y��������d�������Y�8@�ݰ�|�x�w���؟�Z�|�M�E}V��������d?�m3��c���S�2wY�����C�����	eg���,��M���w�o�3_ד"49�&��(ϋtJ�䘚���X� M����������&�Ԥ�u���UK;�k@�cjR�9�m�j��S��x(z�49�&���t���e^hr���Yz���X49�t�;$��>�>�	M�S�]�Dt���V��<}��������&ϩ�~u��i�<���������|���h�����gج��rB����5w��n|Z�4y��o��[,��&O?w�ݨ��cU�	M��N��!��5y���<�:yi��e��8g]��55isn�p�ۯYO�4yy\r�&K$���M^-�����Z��M^���ü��kX�&/M�UN7q����&��gx��E�i׻��kjRf,H7q�_�&/�'�'w���kv�Q4y��~��ݘ�4y�ɷ���|����Mތ�f�{�����&o?w/q9�V���&�U�3/�Y�'��Mފ��)���5�xC���d��r���y�oqC�w����	%��nh�vrķ(�E�/nh�>����+�Q��M����5y���M��O�>��?�ㅯ�}>L����X�7(-!N|S���ߨ�}K��~�9c9���Ba��cy����a0���'c� �����T���jD轊�s\��\��H��69N��ڼ�WXbc_/r�ą%���C��Qo���l���ո���8��p長�#��c�t��}b�4PG���+�,�	�ө�'*�y�?*wr�a���IX�"P��:?����{�)�N;3Xx�y�m�1u:�9b�<��9Hـv�ю�;�R��c�	��َ���Wo]p�q�s5o-��͵tG��|vIkC�L׏
�#�w�3��2G�V��8߹Ľģ�ۛK �4:��	�~���@x�	ό+�|ԢN�4�V�u��S�P�3�q�6Rf* �8�u-/|���S�ĭP?K>�K�y$0��/a���G��Ȳ�j���G�Ȕ֙�^�Ξ��H�s���H��:�@=�����~4Pp�pC�g=ǜ�w>�e���:���zQ&�/�	��i���i�g�X@��{�3LX�t�q޳�#e� ~� 1B���9J+|q��/_/Z�G���G��qi%IX"`>����3�G��>&�N�>ǜ�W�;?�=��:�����#�#9�"�>b���[�EP�s����r�Gr�
��g��6��������-�]���S���G?6O�f�v'؏�9c87���8�9�$���������m�͋||��:'�_����э��?6����]�IP� �/� ���� ��s��$�i�~L@���t��-���:����Ujp �+�@��Yg�ig��@�-�+I� �c�>���"� /u�ͩ(�������� ��XjK����`��/V�DR,@A2���zqdL��T� �-���]��:� ��a�)�!y��"h���AfG��d�Z���q��I�(
x����9���5���$ �	�Ī�� B�DhqQ*�O.
��8�i-?/�I�b$�Lh.|gvZ����8���pP��A�ĩ�������<�!��tkZ���.$΅��V߸ki�� C�o��N�c�t2tw
)9��	���е$;��JK/u:2�e�f�Z�Cp��.j�q���ӡ{.���hz
������e�e�|H��Ӂ.% 9w�1u: �	G�������:�K|s��"GD3���6ɝX�����5W���3���$�D^MPҷ$���	��)�g��s�1��D�H|�U��\p"qN4NWgͅk���Ȗcv�q )'E�?w�!Bu���6?�&R
�����#I����e_�ٜ�3�&/����ڑ3�jέ�_+j�Ώ��[��jBaB�ۜ�>�x
��F���c5�a�S7٢���01�;�,)��8a��&pl2�bL\��,�ٷ�Һa���kCR�%��XQsV�#N�ޑd6��&Tg��wG�����\�5�8'XQK��m�����:���L�G�\����0L��_�)�NgE����&5=���5gE6^���Z`E�Y��e�$���4���H��d<6������M�;�XQk�ＷY0X���Zc����kE�PgӼ���6����h&F���H�3��b7�hr�VԜ5q�P:v����@���A���:���@�d9��������r����� +jΊ�T��O�U��9+�>k��azL@�Ί46)c1�S@�Ί쎇.Q�XQ�����J�{���5gE^��+b�9x�XQS&���u���cꜬ(2{Ϛ<A��1u:+��k��0���5gEm"��G4ո�XQsVẗ́�{��3e��5gEG��(穨�5gE=����������h
��(�Z�VԜ��vjފ����k`E�Y�����E䠁5gE�t��L=r9F+jΊ�Ĭ��
��tVtO7�������UB�����Vt�5gE^�^��\����:���H�jNeb��9+�B�r�(%���u��-�~��`g+j^*�Dj��胃���;�.�|��Y���#G�����Zg�Sӯ������E�P��,�������Z�$���S� +j�Mv����	��YQ���z�d��5gEGuk �+�	��Y�.���4�޷�5gEwH�������9+����-HΔj`E�YQ_�H��'w3���X��7~p�+jΊzl�5Ҙ�_���h��/��\	�j`E�Y�QךL��F����c9w6a)��1u&V��@q��a��9+��	~��M�)%���H.�-3��5gEk�&�����9+:��R�kGi� VԜ]�s����d+jΊ��<E��8XQ;Kn|ɮ���닀5gEm�|ؔ���y�T����h꼘Aw��=w1�`E-ꈢ�E}���XQsV4S{XK�:�����"_/��K|��5gEK��n8�j�5gE=~��GV�����B`I'�搜���y�ۑ��N1{�/V�n��}�R�TԒ	��f�-ݜ�
�m`E�f4�y/N���XQsV�H���-�VԜ�@��8RØ�    �y�h|-A��o��5gE3������c�tV4��;]`8�NgE}�4�R�u��5gE��Xj�%�!/+RgE:��j��O��ږ�H�]�7r]��H�K��.�/�0�YV9{J�Q�"��pq����L�S�"uV�	%�Wr������uE�6/�9a��n���53��`�Y����	<7Lx�3"����wX�F���ެ��q+R�"uVԧ�%�����C`E�Hf�Z)�o��*X�:+��ک�$��_�H���!���Ӆ{L@��_܎I��{L@��3��)6_�V{j-Sl
V�=C�X~�iV�QW5�����
V�Ί�Yڮ%f狀���c���|������.{��7��"uV�5e7�u���H�q��*)�(�L@�Ί�|�K���	����W�"�$�`Eژ��/(_��[+RgE�ˮ���i���7!d ��HS]�&��]��$�`E�ȥ��s�4����h,-d6}6��:�i��oy�N�"uV$�ݑڞ��
V�Ίf�˟%���2�E���Y��#5���
V�^W��c��ͅ0
V�Ί����T���/uF��|�������b�m�}%�'P�"V4���{� [���Y�-qB,Һ9S���Y�̒���i��(X�+�)�����H�g�]���q-+RcŰmȄ峙������'�Y�NN3�"uV4��k94�Rˀ��iT������`E��*�s6+_j�V�Ί<�� @�D�H���ۦ���V�Ί��9�6D�"uV䍎K��#!���uE�<R��J@_���Y�7++�{�D�L�"�%�i��Y:��������%_��]�H���������%�H���9(U,Gn_�`E�ȏ�V�4�Pgj/���%���4ꊾ���=@:d��(�%��(n<X�:+��7Z��"�ʍ�d+RgE-�Pm����+RgE�9�.�lߨ`E:X�q��A_O1����YѹT�o���ƃi�3�����~�"uVt�k%�WҨ�H�\�������3�H���lN&�R�4����Y�!�Z�(\;��4��E��Q.|`Ez�d�f�`8�Γ��v�V�w����"5�R��X����"��ZCci+RgE��5d��+RgEm�H߄@�J���Yј_��w�\+���S�&�����	�3��E�p9X��w
V�QW4�w���X8�`Ezqg�ԩ?>*�ꌺ��XCK���V�Ί���*��\���Y���+!��1&�NgE�k߷��J�H��\��������f�μ6�Q�	V���&�&9wM�����zǦ9V�QW��Z�p�TV�Ί��Hc
���z�OХD���`E�h&�^�-gJX�+�k6�V�VzVdΊ�;�	Ĭ�+��GhV�u��9X�9+�ɊJ�T��n`Ev�r��
�Z�����{���#	^d��G�o�E�;[.50�"sVt��bl����^0Au��Z����Y�u�E頚�W0�"KuE��P�!�Ȝ�<�w���cVd��-]���b �"sVt/���3}T�"V=j��kVdQW��@́�:�$3��]Z��
uF�Y�VRD5�4X���B7+�(-=�)�z�5lh�͌����1;ᕋ3,_R``E�ȥUz�唸����!1�Z�� Pg#go)���{�X�%V�����+@����ζ�Ӛ%+�`ESZ���i8�NgE��욚�)���xgKq�7�G����S�l���#�����Y�,�lע&�NgEG� ��#�2�"����K��5+��+�=bZ���X�9+:d�ȁ�9 +��A7|�K�n�W��҅C����9���LQ��@��]ص����Y��Ԃ��0�"sV�W|Բ���^VdΊ����^ uq�+��u(zյ�5Vdу.�໙
w�Ȝ������gn���Y��.+)#�1uF�X��H����Ȣ�(6Ա��P��b��퐉���,��k8H�UsVdΊ�R��)�_VVdΊ4�ks���"sVd�˨6l`^��Y���*�7�#���:�y�l9LX>�X�9+:��~�#�	��Y�5�Hi?$�f+2gEw�(��y�+�N��9�瀙�VdQW���~Eҋ@�Ί�I��&Py�+�Ɋ�Aqi��~L@�Ί�����2�2�"<��>����Ȝ9[>�ly]r���Y���9�D�1u:+ZJ\K��Vd�$�m�j�e`E��W��ݒW�ԙz��>G)	�Ȝ��R[�2+��A7C�=�Z���Ȝ9���
~�����:�I��eÓ�"�tqp(+��b�%��N����]�����,Xь4ޛ�l�h`E����^�K��Ȣ]��Q�NgE�b���=|T�3XѬ ,HVSgї���"wJ2�'��&���YQ����!�JOu��D>K�t��6�"sVt�����_����Yѽ27��ᮁY����FG�����,�(�s�֑̾����.V�N���A�`E�ȢgW%��X�9+�6��?rSV+����j��7��R]ѱ-AIwFX�9+����ͥ�����f��m�v��le`E=���]S%����o�+=�%�XX��%���r4E�P��"������������# `�Ƌ��Ȝ���j����*��;+����\ׁ�Vԣ�hB�MSVn��죔�e�[V�������|զ��n�	�	_;�d��2.$+�q_�=cs�	�c&<���e�4�'LxD���P1$�[+�Ί<��8�!T+�ɺ���}\��;+��7�+8)M+��^ ��#���/Vԝ����5�/:XQwV����L�/Vԝ��xW�4�;;XQwV��J�p����ugE3S��2j�t�����]�.�����������G���1uJ��9��Wi�ugE�rG��R��V��"i�tY�z�`E���}WD(9i��ugE}��>{9P���kr��l���F+�Ί$2��Jcu6f�ɣ	z�f`E�Y�5V���Ncu�}Eqԭ��u����!Q7�@,�������̞]�8��cVԝ]ݧT�/p�c�T��Mrf�&�`E=�"��id)c+�ɺ��u�	�S�v�)�}���;+Z���2���`EK��M�-��tVt�x��y"XQwV����t������v�_��8����;+Z��v��7u����X��.&��+�Ɲ�6�4�����:����YO��_��G�hP�롏���+��4����VԝM_k{��r:XQwV4��O�����+���X��C+�QWѵZ{��Z+�q_ќ���9ʪV�;��s	g1^�V43b��9H.
XQV$�"�kG׀~+�Ί�r�S9�1���ugE#�.Z�G$���hD���}јf`E���q�,�(u����
���]C���{]�7���EaӴVԝi��[Ƌ�ugE�5��n��!��ugE3٪F�s��c���i����t���:���UB9d�t���y/�I�����h�]+����K+����HS����X@���l�����:����Iu��(Y9-�ugEG����,9���97�^�P����;+��M���c�L=��+�
V�㾢�kO9	�r���`E3��4x)�����<��EjN�`E�Y�ڥ|S��iVԝI�Tn�̑F����X��2 'XQ�r/��|���� +����r�Z��\W���(r��7T��	Vԝ�;>�O��+�Ίd�V�X����z����]�����X6��i/u:+�KG�O�G�:�]�������_��~3ީ������v���E����w+�7��s����V�o�������XQwV��/
b����ugEg亖�TJ�`E�&g���~��pB�Ί��Gݶ�XO`E�Y�h.���xp� +�QW4���z��`E�(���-�X�8���i�������ț��}ݲ�&&|�T�]מUZ�he�,�k>)=&:L����n�u���q���R���:SX�V����ٖ-���h��}�^��� +^W4f��D�57�`E#z�Mu�ȁ�K"Xѐ�� �  :s�VP�l�;w�2B�`E#�"-r��
L@�Ί��]4;$��uE��;��Q� +��_��R�`EC��K�?��:��r�ݴz\��V4���w����	V4⾢�j^~Ӷ<���������u0Z�X�pV����K�s�Xшt���ҋ@�Ί��mȡt�1u:+��T��X�pVt/��U��E�NgE�N�C6׹0�j��V�-����ŋ@�Ί���sS�̤�V4���i��e�a���+�x��^��h8+jQݴ�����h8+s����]���uE��+8��X�pVtsmʔ�V4R:���M|��`E3rPZ�in 7��F�E:Km=o�)�NgE3ͩ�G�����h,��;zN�����%Wɦ�k�h+Z��s�7����ᬨ�ξ;���4�L� �|��c�V4�Ti�k��� +Ί�h�P����H��b�r�&�NgE��RVٵL@�ƈ�.��Hel�V4�͒�Z����{�ht���������gEmi�P���2��Fgn��Ⱦ<&���%���8�����ܻKe�!�gE~}��t)g�q�gEgԧ���$-���țW����R�h8+:��-g/�h����)�L�`E�Y�=[��&�?��hv������y�h�]M��9�X@�Ίl�-����:����%+݊�V4�]t��7°}� +Ίd)�-_�L_�Tgۄ�K�� +Ί&��r}un��`E�Y�7�-�d�1u�}EA�v�;| +'9�n�sn�c�V4��-c�V4�yb{ᩒ����q�r#�f���~T���(�/*f�� +Ί��_�u��V4����Ϯ�Q�Γ�jvY�G���XѸJ�n`(9� +Ί� n�r�"`E#�+����ڎ��r���5��̚ӜX�V4#��������"w�����ƃgE^��7��X�pVt�U��|��+{�� �&VJ3������ucެKX�pV4b8[	�����hfn�o2�h�gE�r*�$g��+Ίt&O���e��TW�6M�,�����E��37~���+���v��cu:+�N�صhOcu:+���/��`E�Y��Uk��n�'X����w�0�X��?�^���;      �   �  x��X;�$7���hC���3`�x#���[R�*.`�L)�XE�۟�!������}ڇ�+�+�o!�1��gt��쳯o�I����WH/��k�� �8��S��b�}�3f��RV��I3 ݩ��΢]T �&T>q�ә�Hd^A�Vr�����2�>ҿ&�\1��2� �V湨�Q)<N�mA���]�t&L�rB�h�ȑ/�2��C�h1��s�}h�$��+�g�wf+r�K�I��z���Q/]у&#�5+vHH�I�Y��T�3��RI���"9��y��Y�ꏨ�Dʤ�E��/����|�2�M�{��H�3s�[?"I�AcF$�[2���>eU7>�yeeM��|9�Q�S3*Ƈ��E�˛ �T}WO�̼�;��*�x2�8*atԁ��7���L�����7{Ou觇�E�j>S��_A�ao���YS�3�I���3�p� �l
J{����B����P-l8���>DQ��w$�� 45�(M�O:�>C}���Hye�Nݎ��+�(�����8� 6Ī�/�L 2��$�K:��z���lv6�+�
�:�Mr>f��¶䕜��4]�$�nVࣩcƑ�"�_��8:����bR����84�5Iv�J^Тnlm%��3�ۤT��u��_C�������4P);)=T����$%�څ�^XU���N�8䇹I�hH��|���ˈBmS�F�{�I�JlS|��Ø�.WQ��35�(eM=���)O�]��&U{KF%ݰ��rO�2۞��Bp+��e�O�S�F�!R���͎&U<h�"�(ųHӢa=�bz�w�p��}=�f��6r�[�(����Ty�{1@d�)����Q���*��t�qy���sSod#!�w#/J�h�OC�;l!-R�E*�L��K�����[�LZt�jvn��5\���);�|@��I��>��]��[ZA�Y'>B�HY����NZ�C>W10��������j��������.���p+7;���U)���$��V�^���A�Ź�VQ��{?��g��}Rr�F�N+4[kT��u8c ����`G�3��A|�����xԴT`RmF}2��bW{k��{�n|��mʤ`rO&�c��M�Cŝ|ChQ��j�|�g�&ƇG���5U⽉�B����X�'����G�w� $�Φ��C@�C��[���R
�x��H
{��}';�_������� �ī�      �      x���M��<lfǩUd�a�H�{��d�GA����*I<�n>��.��m��DR����������������.��������_�������G�<���v��7����u��v;[׻Z��?zm;�����u�ٟK�ۮ��}�����7;�s=tl����7#����}_v��Yޱ+�9�h�v�ϋ㩟q�p���F}�+��ez�?�3XW��a@E`(뮮�ߠad�����q$]�����;�����5�h�n�#�28�qT#��y����?҃!d#S6ep�{Z�+B72~���V_�j�"�#����H�����{����S@����H�Q�o�C(G�r^ɕ[}G��P��*�3����K���"����S(G}/IZ�#������$�d���ѾE��ib(G��󼋣�g���K���V�R�ߣ���T��Q���Z5(�����˽���c{�Ҳs�2(��6%y���XxF�r��3j���A9��Q}�3v,��X����Q���ŝà�{��[�g�������*�`P�����ҁ�2(Ǟ� g�|֜0����-Ϸ�s�  �r\��Z��V��[����- �C9nK ���r�
�P��z�u.�x[�#ݪ�� 9�r�w��8Pŉk|P��5��"�o�*B9~�-�Σ*�E�r(ǟ��V�ϱ4(�][ryy��7B9M֦sI�[5(��t��'J�A9m*��?rx��i�]���*����DN��G ѫ�r��s���i�jPNk
���%�A9��ێ�- ���i�C���5�r���y���o��.kT�O���PN׵?�-@������<�<��t߆�U.x�_��m�^՗�|u(��=��V>@�r�X*)Q��ay�PN��L(�����g{Qe�kX:�3�S[�s��k@9C��x���c]P��u[Ǖ<`@9�v��Yrܭ�3����,��{+P�h�0	�39P��kH�=�q�P�k�+��u@9�޻o�X߻�����셩Ld�{���{:M���*�7�s���*�PD:7�s��u+����rnے+.��t@9�oA[6�����C�k}�ʹ�vM�D� n(��U�'T8eq���{z�%b���ʹ�ߡoyZY�$��ly]�	| ��yd_1G:�9L��yt˫���(�=�4kհ�<P��{ 
<�i�<�C����x���o�8NC(�kp҂,i{�z���^�#%���>P���q��zW�������H�X�����
˹�<�@ ��`����N�k鰜���2����m��.�찜K��;�����[-�QJ���ay/�^٩D���˹����h2p��q�_�2�.x�����
�	�,(k݁Ҿ. �";F��/�2��� �*;9��)�L��|&6����I���Аl�#9���PT���`��k�Ž�pe�g�ς	2`Yt��	���Q� ˢ�� �{M��� -�ΐkd|����h	��P�ep��АN���3;��^KhH�r>��*wzNhh���8z�[xp�%4�s9&�+�k	��egV�{-�!��=R�˟#^�Y"b�Y	7�20f�a�ߙ;-�ŀ;#��b��V(JR(��Άֽ��^��ea�~�Z7�'8�،�N@,�-44A�v�+ ͲHs;@qr&j�{٨s���k	ٳ���J���,�9�	nA�Ͳh���w�&4�ps��$������?鸃�j8��zw�WM&L^Kh��:���N� 9��5�5?�����Y~�����w�B��k	������Ku�j�ҜZ`gi���!pgi�/ըx�gi�&����a�<K���8d��@��|�(��H���gi3�/^�OJׄ�Z A��-賴�f�U�В%4���s`�iM ��,�V��� �����_Z�δ���3�-]�Ү�VW00h���j�����N�_=�����ۚ��݁u�P*�Õ�
4�7M�R���� D�њ=͐V@��O��P�or�E� ���[�c-C��W.4; F��{YY�?�w�h��z��7�H�h;���>$u-cjHPI�H˘p�V���H������	HZF�ˊ�b{0i�I/��DD(-wX�J��pM ��{�ԅ{�M`i�u���0.j\Zn;��5(`Z�>D:d��%4tO��$`����i�g\V�̥@E���k���LP��SC%ґTG�ZBC�N��g�<-�T�e����O�354�,���-��g&�
A��v(���[�X���ƙD-O���
���BCϮ9,�J�Y���u��%* J-Ϯ�)d� 4�̽�9�%M#=3_�g����1�)��n�Ժ���P<p�*�Z����:�G�Zg��i�L#���z�١2���m�FY��|-;,�~��]0F
N����JZ�G���3I�������u�a��CVpj]���HW��|-�!�5WJio�t�Z'�=�}�[hhq�W�Z����*�{�rl��uq�}�o��$��S��u��=����Z�ϥlڳ����:˟k�r嬗�S��ԇ�����Z��y��^��S�ʺ�?�B�V��֢>Mt����t�S���k	���NYSr�Vm��%p�������YȒq��U}P_�*8��B�&���Ԫ;�a%Z~�pj��朊�[�V��E>!pj���ZF�9����ve�u������BʾX2����jm_3�O��Upj��������%4dc�ԥ��QC��j;.+,5�`��:k�O��g�������^H}M�V�|�X�
E�V�9�J�+|-�!�|��z���F%�S���[͙��x�}�Z�m˒��t�Z=�9T�af�S�ｬ���(8�z`�����BC�����b�M�����8��8������<e���Z�\��"��Sk�5g�X��c9�P(�>f���P�{Y�����j;o_s��4�ƚe�z��xpjm�d�֛�ܢ�Sk{��+�	���Z�V�i���W������D�N݂S�*�.�	�J�_Kh�o>TO�2��Ժ8��x��#E݂Skg{N<>j�Z{���
��2pj��Ҿ���{��~�yQ�^�GRpj]��df���Z�ǒ�����u��Ԥ�+*�yA��15t���P��ulU�1���Ժ8��~�8��]q_2��SC=����^
N�c�x��X���u�}����Έ��tfN�Zg�4�������[������S����Պ�L�_Kh螕�����Q$8�޾��+�-Upj��z�4\������Rpj�Ǿf�����Z��V7c$pj�7c,g�N�O����a�N�������@�.Upj�:���
N����PՅ��Z��/+T@E�S�s�
_8?�����"Wf��Z�}��FW�u�Z�]��9c�h����&�f�~�x��b��D:�8�];.;����R׌�*��V=u�5�3pj[��P��8��z����V� 18��z��|�޸�S۵5T����5pj������4�,w�Pݳ��|8�����I�O�6��Cz��x����ʣr����M�4kG�sBC����v�z�6	5���x���&��j��E8��X�/uRY}��&!�Q�x�[�6y���5K����f=��쁦<�k	-N]�+?Gabg pj[���a�$K5pj��q��CƷNm��O�t��`�Զ���Y(��S��ZX;��S}�Ԧ�LY^�sK
pj�����浄�t��km3��8�Y�C�z��>���f-l�8��s5pj����"��kBCf{F�3c��S���Ra��R��lk�`��6�������8�MN}�s�+��[w��ޕ� -N���C���ռ��	��S��+d�5hNm>c�ɗ��}-��UO}:%��	�o��y��S�ϸ�#�<��S���E�VV0pj��j>�b���a/+�J�nNm���Ը��0_Nmm�!ecFᵄ���C����QNm-4,��-kP^Kh����kG��f=5��k8���ί�k�k	�P?T7<��j3�/�+͵<Nm����1� �  i�����C�>��Nm�S?*p'Khhr�zFQJ�Nm���VM�Nm=��?T���P�-����9����N��!r���m=�RN8����SJ��8��{�U�ј;fAC=0�S��8B��6�NP�H��y-����e���uNmc�Q,�s��%44�{�+ۚy�:��m�u�����F��O�c����9:����ũK���鵄�f=5OE�����B��b�=)pj��:w��k�S��?tk��q�������ٷ-��{2��M4u�y-��PO]c{�Nm�^��.(�(�����PW#<�d��v�5u5!�7pj����H�Iׄ��!�]������k�p8�=s/+=1kDNm��Ce#�~-��g�e%w��컁S����x�V��m�S�l�Z��������%4�
ex5��8u�PZ5���y�j5sWN�g��7���+��a���N�����k�N�����:��H���2�R;���=�pR"�q����UkОd9`b�C#���嬅-����rpj_�ԅ��6_N�����f���%4$���[&upj�}���+9�
88�/N]�ʕ:.�������z�=��\�v	�����S������7F N�2�5����	Ɍ�J��Sw��Z��ŧ�Q���S���QzpXb��%44;J�x[pj����1�k���u�C�1u!spj_��Pu/�	8�Ϯ����5��UO}��G���4����<���Ԯ�U�)��,�v}�n��������3�K:���Ծ�K�ݟ�%4��~��T���Ծ8u9�e�6;8�[8_vh�LKhh�S�z�%�Aupj��;��q�w������>pj_��t�(���S�={�?��	N��5Z���ܕ�S���q����8���:�h�N��5T�H�,���h��y־����}v�/&�i��Z���/��]����ù�B����v���հ����}�S���f���ۑa��8�H�Ծ�K��+w�tpjo��С�8�'8�7���x��	N��׻;6֏cN���G=�t�����f��lР���}q�C���ppj�ԧx�[h������N/�����R��m�k�S{����Xu����u�u->sWN�S�դ��ppj�,O�.���P{٩�$,��������L���W=u�;x���Ծ꩟é"�1:8��P��O>8���_��)>'8���jǞN�#��8����	N�c�\���jN�S�3������>�O]>����;8�����ć���}q�R1gimz-��ũ��|����}�S�*����S�2?��.�8�߻&�j�e��gߏӚ��;�%449�i�O�������:J���C��ﭡ��]�S��Ԭ��'��w��t�NեN���TT}+�T ��Wߏ�TG%�S���R{;����g=ue�W� ��}�S�O)i�.upj_}?Nu�)��՚�Pk��
8�?��P=�J2��'�1K�|���g�J5��S��ԇJ���S���1�I�>8u�w�ĺ�N�.ٺ-�
+8u�B��t^�����V3vh��m�SN���J�n��G�R=����-N}�$ם�ʀ�Xw[+Z��j��۪�>�qa.��S�+��
{K߫�n�y]o�4p�&����q~6p�&;o��V����ڏ�������/��ڏ;}��Џ�;���W*�f68u���(9�3���I��JE+{6p�&!�/'yV��S7�UsWd����z�vȄ{��44?}H^�{�ƷN�VߏrvOR߹��}��ԑ fN8uө�S$�ZBC����!"� N�t��?�������s�%{���N�t����6p�f!*���N��7ke��L���.�2��/O�n����Θ�8u��S��>����[�b��y
��S�XO��@8u[}?�W��;��А��A�1JzNh���]�r���S7k�a�p���-�Sׯ=�c����>o��݂S�ũK�\�Y�N�ܗ�N�|��x�n�?u��-��	���\�J��>p��gÉ��}BC>c��;�j����\=��k��m}��`���k	�����h��Pg�s�1�k	�z��7���
8uk!.+��N��. �r��N�f=u=���������K���	������r>;U�4p��B���+�����@b!�^�����U�/}���-N��I�t����O}�̙23���ݳ��6��7p���:䕠�d�k	�}ε�NٽN�z��p����	-N��Z�4�wεV��f5p�>�89v�i��m���(�Zn��m����0���ۘ�}�O�W��!_v�N�������]/?o���Y{�"įI6p�69u����6�����gOs�����g�K���ǃS�{�U�tR�	N�nY���š�p�v�nV�сS�����&�3���ݾgY��y��S�{��*^*k�8u�}?���t����vb�e�t�k	���N7y��n���N������	���������5��O^o������\�n���ji3�������Nݞ�Ǳ0)�,�nO����`��nO�q~���焆�{����[���._����o)�S��+J����������g���;��N7���2�e��������{6�j?�Aep�8u�\$Y���Ͼ5w�;����;o_��v�Nݯ}F�F�����}
S���S�ũO</������15/���N�e�J�o*�����e�-��N�ŷ^�ݲ>��Sw��P��H�����ԥ����1BАl�z��u��S�UO}�RB��S�ɩk]���������2s�����ڏ�J�����z���L�k	��N��{�[hH�Z��Ol��Аn�����N�u�Եƅ�����]w���M&�-4��~�*�uo���f�5Z��������_O�0w���{��q�WN��.d)�D_Kh�B���o������]�'v���G��,'B:8u_�Q�<B�ξ��А�ؾ�O������(r~-�������^9�����o�����d	�ι֝������+{�2W����Z�C����|��W��V�����>����;8u�pF�P�#[hh��>���~_Kh���V��,�!�ߞ:���o����o�ӹ�N��Η��:UEwp��vl_+���N�'��_��T��ZBC��==-�����=�S�>��}�S��JNT
�	��ݠ�b����P����o\r��N�'��$��#�2p����|��g68u�s/+��K�%4��9���Ϩ>p��m=g� ��N�����x���Խ��j�q���Sׯ>�j���;�Q��ZzNh��u�ԑ��ǃS����?�͊�������v�}�:8u����
� 8u��b�C<������O}���sBC���ԪW� N���u��S�Jwp꾾�x�ơ!p�>�z�_*��:8u�����S����.Y�҃��S�;���c������Ե��
����G�\�����mS��33������<i���;�e�~o������{��ڏ�	���;.�~OJtp�9u9U��n��{���]2�s�S�'�����'�S�'�1����г5tR<�'8u�:t8���?SC��2�vp��츬v��	�N��w�X�焆�]?T;4��-��?���@򱗁S�'�A+ � �K/�B���������+�P      �      x��}i�溎��ϫ�dC��^���:��$�{�:8@V)mK�A*�z��<~�B�1���?!����
~����'�R~��ߋ��!�����/��ɿ��b{I��C-I����k��Ki�J�1_#���Ԛȿ��S%Fz�/���迆��Y�~��W�5��A���[Ϛ���_��|��żYL��<��_�˭z�}5�4�jt(�������>���A����5c���w~?{�+Ś�˩�b�{��7�HzV�ү����x�̓2vA=)�R�} ��� �6D>!q���j�1�_��Gǚ��&zzB�҂Xiǿ���|����!���{�i�;�bE���Ԇ��Bo�9��/99mI�C�C�h�O��}�>����ZiIۇ�e��e�(�_���֩zxy�㉿SS��ZH�����J8�,�(���_��~����Sb��LO��ǽ{YZ��I�	��b��8�-��<V0��$��_m{���jI!J$�����Ś���������Nk�<�O*�Y����6үoOn�L."A���s���n?�I]yr�S"�&�������o,�7mt�8�F��Y�	O�ֺN	�\/O��a 2I_�"���Y��ԓ}�=�o�ֽ�y��d2v-��|}��]���|	yȰ��(`����v��橷#IP��Ȳ�*��IdM*9���E0v�ۼ�\ن��;����R>%�3�/�� �^�T�-�ӿ�6��RVV�^,52�i��h�c�zI�;���h�U?��q�˱C:F��BR�Dғk���D�>I�9Y�F���~)���R�
�,kX��\l�d�U�o�ɇq�d�/����E�ȉ<Mޟ�|C��~WR�@[�ڴBl{�6� �M��6<Y=g� ]�v���k�Պ]T���摝���������J���	O��E�fy��,w#߾���2�;.�C�H3Z
;�v���K�2����ڗ|"�u�'���hM���p��5�Ti����Iks���+����I�ZCl�9���IJ�Z�Z�*E�ONZ���	Pm$��D0�Ҋ�ĕ�sE�Ў���HE�=�z�%�3B~��E�� �$OӶ�7ni�r'��H�߼� H�5�*�}Έ�
�z�]z��KC�Xl�B�{��>�#<��/��Nޜ��l]r�!���%'A���T=٣�FU��bIx���{eT{�j�E�g���}�!�Z��Ц�|�x�*��7����iV�W<t���w��B��8�b�P�1닯!�A�.��䞗BI��0h~O����ց"�����,+{�s�)}�y���\���Q'-����wO�tEe";ő� ���]"���Cψ���{�l}s���ۓJ���(��:܀>�Q�0];pw�^O�72t�1�]�.^"�hc (�E|R�J7k���fe"���{ǻ8�����8�
;����XV%�3��d��U�HS'��A��ze�R��[6��9�}��`A��-e~�`m ���cg�گn"�g��tN��9�'*���$����\l�d	����>�{D-�R`X֌,fL�>��<&Jk�����I���~�>���H��9� ���U�F�H&^_c��_����^�Ue�=N�v-kr����	��w�/	b2_E��r��5|`��<����he��G!�F�\v��p�
f��`��q^�ɠF;b�޴��{8�n@��1̬�R@��8'U���LD��\�6��9�� �;S�2�5�P
T`]�{�L�XL(C�2�Ԓ��v甆ʩhQ�
����G%�fuo$!]�eCn�j�`GD��!��J]�k�?����v�7.(��"[hc	c�E�Gc꬀��R��������F�����w�[�R�"��+7�l�����q&�M��LJۇO��y=����nhӴ>
-���"`�m��`]WiGL�ma&�Y�l,�"��"������� 4Ci��І}{
ef(O�O�46��PK��j�'|'��p�N���I0��v�_��)d؉�(���.ɲڌLF�m?P��.�M�b�h�-�yʻK�t��HR�2���<�AIc�\��b8g7���wJsd�/�1.��E�z�0�
��3������������*#�\�?_�N�Öf�YE�� � ��[G<�i�O���T�t��5i�0�q��e�Vֳ�q�c��������1�X�o��'�ppi�������!(S�+�ͥ����%�����0t`�U%,������rp�%���i�=�7q�r�O]���z�fҭ������S�����|���:BZ��D&�,��潘ԐV�h�]"��:�l���>���ųv�M�+j��o�%��Z� �S@�R���l����������q5�QA ʮ�&N4Q=kp��tKz��]��
g�Y��q��"�fE����q�_�ܤ����A������VQ[�u\W��2	� v��&󚽨���ثNh�~��p�8m����U�R����d�o����W<,;ԛ����³"+�|�C|���D7�^��3��M$�̳4�g��:�K�@E��
uX�����U؛i�)V�������O���ʬ����A��[�"I�z�IZ�������4���8_ͣ(em�h"���������n���1H-y|��H{+\$9�f�U�W�I�TγnT��_��VJ��`�3�U�Vpj'�tF-kC�;�"�J6�c�B�^���j�L+gw�YU'W������n�ж+(N^��5����v���V���f������S8NE�6�fa -(G�/�����к��f4��<dg��{��l�ߤV%F��)�v�$�-=�Z�u(uvY�(LBH�\�Ū��q?J0=J�ڭ*'ew4�6�Q[%,��ڲ-B5}��Y{��	>����6�"����6`ԑl���{�v�Y� ������s'�O���ҡɽ����g?A���f�+� ��$��6Q�q3�W�2��d����`H��u�U$��)�:�eҢ��]�A<�˓���* �e�����bސd����S2?�E@�^f:���FU��sV�R���\q=Z�&���A|W�
kn�'���U${d�j��r�U�9ZE�04��N �W�`�>��@Zwz�/ ��X�ր6��	.�V,�"�@E'=�G܊�j�����&�.��2�Cp6Q��+B�%�����������д_����KC�uuZx�Qi��&�<]�jQ[`r��[/��[	@�U=h�aa1�у3��'G_F����FB�K���6zr���(ԳXmm���Ƃ�{�2��Q"��h��=m�{۳G�4��ab{�R��w��M�jL�)r�~{\<SF`c��ǃB�����@��a��W^�b�RhW��=Kb��Jh�3%DƟO���&�w���֙%����v����V����s���wR�Bq�(C�Ν-q�٭���k�p��P$ʳy�v�%0p���}<^,���$�������2���'�}:���F �ȇj�q�w����D-s��l�?Lm#�����5�S��8��o��貵�( �h��J�է[��ғ]�t�h!�T���r���>˥Q��
"�x��O��¤��L��7ތ�		ԪĜ���Ϲ��7����(}�QL�	�*�'�<��/$P�d`�9gٚy6=0�_�+OZ�i}mDiQ4x��)E��PE�Qp�-��h�P���?9r�Lǥ8���.$�K�;�U�c�E�?�Tg�hC���8��#$#�,,�+�q��4���M���t�&g�W������M�%�ш�����aۦn+����La�c�b�4�(� ��;�B���'I *(+f�U�Mn<�,/ꪅ����z#���l�B�徿`g��`|Vdn�)MtL#��_щ#��P=Hݙ����4�[�����y�����X��j/(�H����%㺨���<(�k-n2�9ZԹ��z�Ȅ��Y5�*V�d����n?�.��)��+.��2^������MT�DG��H澓Ac;�����%N�    ��r��6��x/27qg�jWׁ��y-썯Wg�L P:24�	T�Y|YS:z����P���H��7%ޅ�]k?|�-w��ӻ�<8�&T��*ڜ�l�҈�м2}�!�
�	u�wcϮH� �)�d0� g���Ō�a��W`�r�l���Y�Q��7���$%�er�ε+Fm�;�����h}P2�����u��a�b�h���1�:d�%���e�E��p�]��&��ld9 ^���yV���]|�r�h��Y�yqy�@ҝ���q����4p�.+��1��@���h��k55�sF�C3-x�L:-*;k��kE=���YՂr	�$���E
wr
x���� �9(K >^Q����Tv2@P�d;�L��:�5�u)M��+'V�af�cM�a��j�|#؏��W��@+4�¢�|�����"hHw?|���!&��]G�;��]�&�>��s���X��`�-�G]F~����L�,`nrE�]��m��iUd>gy�ϮG�5 _X��1�
��vQuB�U6��ZkZ%qR܏X7��(�� >���m�Ud���X���h^�v���Rj�Pr�SJ�u��-��&(&�I���7ټ� �����������ِ'l����
F�`�ѫ��;6b�H���«a��vdP
 �ؿ{��eue&�."�'�d��N��c}���k���֊��̞<�k-F(&c��%����I[3��(~�����2�y֘9u9]��K�K�.���揺���W1�$풚͒�u|�� ]�=��j��
˻j��	���0�Y�I�Y5Y"cFO{���U�q%��ڒ��ؘ�v(�����B��\��	��+gBڌ��~�Ӈ��Ƥ�;�@����\k�����ĭv��$i���2ӓ3��c���%mv�	���OM@ɾqK[�1|�T?���
�A���/�;�HBWE�[w�����M��\Acg�@ ��Y��)�G3aT�~�G�:�~�����\��/ԝJ�Gw��P Q�ȷ:��-īe�p%�� ��<y+�!�.�CG0� 2�m�&/�XDn�9$�0𣯚F"�wn��Io��OYW�0.���Wrb��o��dpA)A�]��ǋ��������wW̴���]x`��7%!����p�Ё��Q�"Oc�����sqS3L����������e����DP0�6�#_���B���\�/[}��aZx�J�u,�.׮G�'וּf��^�3��G��XS�v�8I��@�LW;-V��>��<��uzO_��JN�*<U�O����l� ��Y�9j郍���g�,��ԕqѵx�O�|A��!�����3�����;j���w�!{��&�1q���x�0��:����io}E������W��~y=]����rN�rV�'�9�4 7i�p�]A(��ap�ц*��ykFܡ��h޲p?O.���%3
J�Z��&Y�n�j�y׏u3�	�$�IbN����q!H�1� ��
@]d�.VD'Bz�Wp<ǳ��q�~��z�d��d����I�=���%*�;�n>���e������oU������)5�O=��j�f�ji)�e����iV਒s좦�.I�TFLX,(e��8�|�%�x|j�x\��,sMjS��")�kp�m�	��VԐ�tfE��Sjh�I�1	���ȳCP��7�����w�풦z�*!������LL�/�?Qm]�{�M,E�*S�&/�ȥ���hJ���3N�㍧Ns1��N����n`h�c�磭:����0��/�q��ӟ�ն����d��,��b�|=R�4?�/�g9�͕15���ʀ�ٌ�O74=��p�M���<;�E�<��L��h��Ɡ��X�ܽ[0��
����"�di��=�[�
��٤�3t�m7�Z�|?p@���ʤ��h*ó��-,�bȱ�&��`e��6�_��*q�	h�.�qT�m](��<A��$:�D�4N�t��nX��£�	�y�}3���*H|��W(X/�O�aʳՙ���G��l�op��Ҝ��&�ꄑaA��+PG�3CD
f�I�:}�>�V����'���ē�'���,ad�oQ�,� �Q�n�P��[�>΅3)I�h|7��e� U�Ibw~�B5�^f/�v'nt��JŘx	;��N�f�b z���->�b���Pb�c]��Tܔ���9�{��k'��̕h�/�nù��	��e�A�fzF
��P�,��k#�ZU�kM6;�����R�^4�_�����<褴�:���:�,:�=��`�	IvWVg����[�}v�&@gM���>�Ӗ1t�[W� 2��֞�V8�����,�U9�|����|�j߻�~�v��I��-"�Ӊ�#�a6|0Ԃ`/���*)����!b��M��(k�nWm������"$}�mEmc(�F�D�;r���: ��>��M�+f���ָ������^��2}!���sO�{��Ɯ�r�
��� {�F�M�xŉ�Ԣ9
����%B;�� �淧�i�q�JmƜ����'4�-�F/��xu�B���É�P��SG�.% �?�����b��W�O`��T��8�nJG�8�q���Kv4��i�i[���Q�2	���o�h�Ÿ��;B��?1��2�Lo��c[Ҟ�����X�X)���y��˚&C�1���uEv��m!��vXwr���fBk�D.��J�v~�BQ�j�����WL�uA�	/F�V[�������`�bP^��\������.L��A�	�����a�SY�މr\��(��������'.�nf/�g1��U gd�f�#A�W\��NJA߀�>sq}�B�-������R�2h�|r=�QY!�D97���.y���]b��>ۤ��������PW��ճCU7��Z0���$U>�p�z`���,HA�����P	��r���6�6u��D����h��kP"-+��;C�!f��y�ϙ�晘F��8���c��TZ�*�����G�=�K�?��^�l��U�[�o�9ӡ��6�L�A�A|EO��4 r)Z)"wڟ-e�����-�L7�#X�������c����`!@^]췌�M�@��S�c	n�o�)5�*M��+X�>���qMsf-�H玱k��Z~�{_'Մ���U���N:� bbԃ���6���p���<F��T\�Q��3e�6�N��1X�S� ���$��O�U�ЫtHηZ���R����q��e��29!����i�C	. O̯XE�pi�-�F���	>�-T{���E�mpf��o�����m8�U��k���M-�܅��yXg�����0U�C�Iɚ�.��d�4�tG�W8���-����p\������j-)s�
��g��u��zV����� �K�$� l�l�/޶�=����v.�se�h��A��'�/s2�%B�q]R��B5����c�Z���t��id�6]�(�}���+Zj_�턓,yW�����Z#����˽�l/J�l'A��%��f��U�]�I�{���Ir��ܸ���s�`��8��ƻ���2ỏ[Q<$nn��s'���[�H�<c�QT��i�������_8�0w7$>T�Bt�g$�eV�5�<�� G2n��+��|��j��"��~�/-�M�qPU����Q���F@��aΪ�ݘ�
[��T����&o��ɝ��U�ڈ�uj��xI>�����t���M���gHv����o�`
p�HR�K���>�q#P�s��!�/�Ġq�P��$���i	�Â2\�f���2ֲ�v�ީ�Gr��9I}����*ٙ�D��Y1����d�
��&������l`�g`�����/6W�N1�6�M�}v�%Y���'QC��묡��0|}�� �im�I��0s�⽠�[KЉ	G��,���%ւ1�yY숐��z�f�)E�R^Z��U��O�髊��ec=r��X �Q�#���w�>Zq�/��z����h�%�j���|ub�^�^ %�<0� �  �of�)p�HGqff�
g�̍��U�iqQ�n�ᢡ�><ʜ��e�q��^f�5�;����Vp[h-(´<!�3`˵̙:�t�%S��p�z#P�:�هu�/x�D����t*ߞP�x����ڸ��=��'�\I��~B �<�j��)�Rx��!x�'w��`K�Z�y�ā[r"����6/�/g�/������.������6���|!p�)�<�$��&�F�/�b?Hcps
ʳg���6�)��#
wEƈk˷���*|8$Pp�/۪��i@�c_	�
��i��i5�[�u7J-nqF�d�������9��T-/�X�d3�U�KG�|�����n���A�������Q�����U튽,	$t�.�d[��푻����r���}j"Gc����UAA�]~��Xk�"��Z�&Z��~tڀ�z�=$�L5���u5۶}��Z���o7���k|Vi%��ޕ��~t"�M��NW�	f��v)�V�]�"���`�͚��M���U��fnnd���0����-RH̔���?:�nhk��&���
N��d�����7Z�#�fA�1&q�uM����|����9>��^����:b�g�����WN�$�W%3�0����_n���BCJ�l;�����n�����u�F!Kd#w���J��򎖣�}�6�I�`�pد4���O���]ibh�U�գ*_x��/�e�R4�[hU�ñڐ�.7}+ae9g����B���!|�p>q��I��j��-���* �h�J]0n4QuX0��$Y��|�Tƚ���鄴[hfp���Z$S@���n"��4��C|�f�!�:Ohny��N�4e���?W���o)d���j[�T����b�t`��
Wݪb*W�H�Һ���ǣK�ha^۳P�u������-y��Ŕ��C�A�s�8��^w$�B���L�����a�綴��/*��qN��9'����3��^��7+���Xg���]�?Ұ������n��`��(��t���$�
k/ʥRj5_{��p���l��I����-^q̻z?�/H�v�}7�Tx^oK�&���:�6�sp��9��4g3�|p���??�v/<�9��A����a��v �,=�/l;hd���z?&��֭O6%:�Q���*(��	���oY��b�O]�c�n�`0�����6�3��=�6��|�+~ض�<��,6Τ7z����T����1,���-8�.[�	HC�޾��Q�o,�"2O���Q�40k!.RK0����4{>��=�e��7��x�}6�~���;��X2�(�sX`�n3�V.d���Bi���4�;`n����v7�4 ���x�ӷ��'�����m��9��f*�÷M �]��-*�<s|0��������)Ɲ���
��G�;�w�<���ҵ������y���)�g      �      x��}ّ������ρz�yh[�;	����Ɖ�Q�Y�H��1���=�RH�/����'����}?�i�=�Ki�X'~�b�KM,����|�d<��e�u�_�]/)��%��f��Ծ����Y�ĳ��{����{���{ђ�%��z��}i���K�_<?{�/��~���
�~��uϠ���t>e�%���_g	��y��җ���-<��@��¯��=��5�>��6�/��b�>��1�/]��c���?�ў���߹v,��ģ�4��ſt�N��l��{{>��\b�U:���P^����.��N?�Dۼ�2t�)B��H���|�"�v�Z[H����AgR������Q�>����IXf!��}����[�:�X�[�~�S��+��J$ô%�_����%��I,��ߧ�����g�H�S���q�IR^X�n}It�$/)�c,�R*IN�������E��? �}�`4fLڤD�_:m}M�"��}��;IXu+�2d,�J�Ę�&�q�&�iBaH�H0ӯ�k`�%ˬ����@�V���%�O&	���֧Fkc�%��e�#�Q��
U��G��kI��!CS�=Q���/��t��a��?���DH��yOf��~�9�h��.5��:���\�hl���2�a�sT&e���E�<Iky�Ҏ���s���B��U4ށ��Y�*@�< k�@����ٔ�{��Ѭ�}J~E�LOط�?(@n�H�6�У��H�ɓ�q>?j�����6��S�y/ee�쒲�s�s�כ���},~�\Y��a�l�1���=-,!�q|ٵc��~y��̒��d����R͢7�u$��@+f9j����f�G��������gΓ|3X�@�\�'l3�)� �:���5�/N}6*`l|,5,�Y�k6�\;Y�I�,�1b&��H�ᷝ�B�X�B�I��t������r��YI󜦱LUF�c��4-3�6ޏA�G�_�rgEG@lf� -��$	 �\Q��1��oH���c��5�2̆�Ϥ���cT�<'�j0��-�-TJ8_�t?����/k׊��7����b@2�e�f(��,�@¶�S�iF�m���o���/o�~���Dz���|L}��.S�NfC(��K�迊c��"��W̬�Ky�N��2��d���g���A��t6����~%K���)�9e}�KJ�[�U4��'����r�[9�T�(�v*<jE2@>"v�2������#��(ٽg�+'"�7��N"�T����5����fU�� e�i���#@��� Gy��Ԯ�?�����1�d%�A��p��X���W3i&��u���FBl��o563j�I/E�y�p�d'�ia1((�1!L[�T��"�s��tzD[`�ce�� ��P�3�9��m&p�8�����Dl�C&f��L}}M��ib�	�|��#7ơG!7��9�he�C��������)�
f�e�HP������h��70�79���A�pva8i��@F�w�b�F�<O���y�׮-��ц�mn�Zx[%���$'G{��Ǝ�j��ve��EM�� @b�z=���kSaa�Hb[��8��D�!�:|p om0�-h2���H��X�]v��*B�`�^��<h�]����`�� �	�E���}�J�^#! AX
�K\O2���m`	h(�ic��݇�^/�cѢ�m}�2����f�F�=K��@3ʥI�T�N�Tz�[��^�c�k�SB1���ݒz�`�;�c���ކ����t�c��" ���o�+t�:�(�F�ac>���0;H�D�9Gl+v�0��u�͉<��.����5�L�]*[,ѥx'�] ��ʎ�U����З�{k�(�wTȲ�4�)j�O��ӓ�eOq�~�"�h!=����Y���>�L�m��I%���5s��ۓ��Gm}��6�eЏ��.�1d$����-����0PS�Q���lB�����݄�2(�j��b��<��R%_�Y���.�#��P=����a�DD�;�@�e._Y��Ԑk
W����Z��U sq�[�I��H�gu;�#t]d(��_����vԵz�ֻF��I�7l/|U�t�>W�c:�O����#�� "���O����o�18�l��)C,�.�)���砂�����'ֳHgj��V�oDQۿ�:��˽��TG6�k"U{�7��: (���l�Dz�, HDzW��hQRq��x��ڒOTg�v�6��ӝ�C�WٔģZ�����A�p��НK�
�夲La��*	[#��R��jk0���J}����t��:F�rdw&���8����2nAm((��''��kКĥ�{�� 7M�9����Ú��$`�6��_B��~�	l%�S�����E�E��v-���P>���;��Mv��{��-G爂z���d�h*ؒ8� /�V�%>��,'�5$
�� ��Ԗ�7�P4i�����Iy�E�ɢ����8����:))����3I���/!��i�8ݖ�5�Ft�d�ډ���2��;�2$y@�S�h--���ǿN�e�� �1�2.1���@�@t�N%�������� p�!ڲ����2I�r[С���� �8������TuUr4�,�>l�є[�����JYz��`7�
,R�X!sy���g]�n
�� �����m�
t��k�0�,H�e��1D��At�
�p�d�j�W9�(�B���N��W����G��������m�1�(��
E��,�ɥlE���CdБN6�mv4�3!y���.�)l��6��9fA�� /���lwv ~�=Ô��ɡ(f���� �&F���sY���Ļ�D�>�-�m�9�NƱı_�`5�'�/���7���E�����3
.�c	�cJ�]�s���(o"e~L�'��xX�^C." ;|#����a�P��C+��L!]
0 �\����&�ɑ�r�e)���$���]E��Un'��Lި�����V�5��(��C�1v[�؈�DGۻ��F�h��Rβ�3�j���+��1��<B��w`�:U��"mV���Q�^�{�o�t�Αd�������˿�ν������(*>ȓv����X�a�E���j]EyY��G�7P��`u7kk�,$�a��E��9l�v�E�ҕ��R�LSB�ȅ�uHNuAb���5�����1�Ea���G�N
�V�ăh�k��)؃J��@�	���|���f$łz�.j`�-���Mya��,_1��^�?(#��Xt(�A�)s"1>>X��ME�d�i|;���8	�uN�4��}�twyD;��;���$�<�S�fe��0�:�"�:ba����e�&�w�k��{��	ưci<{+#���2ғvD���g�\�&F>��<�6[��"��-hX ��3J��yQ*l�W�{%٩�K�s�'����� ލB�
t�?������� ��h-'��3^}h�5��^S!!� ���>!�pK /�٤�lwA���6r�^�
�~���ăP�������\���$j~�zs9	���%�ۖP����������Ͼ8�/��Qk�.���`W��:��ΉM�4�M���ՠ��0%�
�7�1�E��J�#y�6��Y⣬�#� }���.��V�饗����a�C	��"�R��4<7������!*f�In+��ߕz���XdEkj"Uz+���2I��W
��f�To*�6�ʈB[^���SC K� ��e@MEHd;3�9Vʨ���k���v� 3������DM�@���8PQ:SGAB���d'�j^� Mb[���:юt%/��ԋL't$���T4��"uR퉐�^0��r L	0G�ק�q���P���6�L�r���Obv�@��R0��d�	����E\y���E����/&��Dx���/�Z�AQ�۱�q� � �h��)RV���a|� Z7A�H]�@GJZ�<ঁ�$U�A-x����6���!����c��JҬ�4�˧}��Ձ�@�h��i��u�!�@&:��^��URF�`j<�,����#�g��C[    Dq8�Kv�8��=[T�Az��Mx7�d��ir��%k�i�
ЧE�36ۯ9���HIs�V5��R�ď�I���v �\&٭�V���X`�P��@k�[���T��N�%���,�eJ�I`�ŀZ��1�t����$�v��,�,<�x��|��M�F����CFv]��:��-�]诰�~���{���+O��ӡ�ߎ��L��r~FV�����Ŋ_���I�
��S�s����
R�¡��
�BK�)�X	HT^��½߱���ZO�Ķ�"4·Q��B�씧$�/~L���:�������2�U��H��d��R>�e���!��-f!��*:k�$yN��k���RFN�7BZ_�\%WL2v-	I�i?�)�Oʨ-�j7jPܔ��#`α��RE݃D�s�6�$���c��w�{L���Q�����1d/UF��ωە�z������ s�wے�~�qf��W�ִ+�pf�#4v�[zS�����sE��t��[v��#!��"A�k��#�8��,�Q����3Z���Z~8*'���1��]�0�*��,�G��Zݏ��I�����<����]�l�ʢęw�lp�"${��Se��94I.���X�3��s�[^�XA0^bέq���@[x����B)?��3�����;"��*�j�	Oo9�����o�l��fo�[d��$�##�5�5�"g�m���q�R^���T ����ɗkY��s�+�
W�c? ���8{�vU�8Y�N|eT5IcŦ-��q����(��s�M���
��B�}^�i��l%ZC� �H����A����q,b�T��`�b�����ә+ıpy���&Ĕ�� 9}u��Јq:��RPvf{-37�BP�4N��oA �	ĩ\W����RV��B[��gm�bPq-j\E�ca2����A\CW{٨pVsl|3��i��ݧS�H��20��-�$�.�����#/�.~�]���#a�r$�����=[������H���]e~�G�J�N��U.���D���!���ie��n�Ah���3��TқT��̶D���Vs2�&��Ԙ��580�Q��l��"d���1������ �1�폟��=��k�sr�;�B��[C.�Q�'J�f�`��f?�U�N�l*%�k�J�q�x�$%�,� �)�t�[�V6��c�׶�vމ��3���TX�Sy�
�~�4�����S��
A�<��禖'��iZj1�j%��u;X}��{m�1���<H�hY�`��u��`����]��I�� 3Ҙހ{YhV�&��\���e;)$���/�����j2��\ă�o��k�����[M�y��|<¯��K�F) ��g�ĝ��$�f����m�HŖ��>�n�>�cq�*����&�qd��Qע5`��5h�(ǻ�� K���8,xՀR���>�D��ט��p��jv}���LkH��{�,<"a��+��}�&xC=��!�:���>���u\x�"(t�}�\zxHa�+�tӲT'����1����IK*�� 1��xQ���I�� ��qw�Y[0�D�hY���Y���W�V^������Ua��:�*u��Н;���e�J�@pd
ᢙGcN�̧���
�1Y.�Kk�<�%�%>f�g��qa���pfڔU��8�B�y��	4UU�����9G�UScy���z�}��=�� �"��8I�'8A��eJ�R����BT=��1QP�k&�P�U1�{�3�����f�%%��d�K{tSr��D��os."nt��s�3:Ƣ'+'�/�HP'O��2����	��>e�
�z,�
�U�,������_dQ�ʷ�S�j��%1m�hX�Ȩ7{А�����ѥ��f�r�XAG5�\�T7,�.���w��&Xy�A�� �xnH��ߋ�J#l�4����y���L����Q ٝ�ԩ���BS����HJ��@C�z'�L�W�T4���$�A0�%$i3��?-S�*hJU��YVc�F���#C�ia!&��F�ĭ��8홪(��u/���	�kOޔ��A�����k�&�=���2Li�f�x�7�6;�側���<w�����[.e����X�*@��3'�;$����~O��$,`F�w��V��qE�ʋ��qk�]�0c=�xnZ�2Lh흞Ona�Y�B�EĤ���FU��$g�ar��vDbg��
�`wn�c1t��`P#P�|Mj��U��u�E���ę�z�J�Ime
z)��~Q��Lo7OU�$ž�����0љ�\4�c�?"�ܢjjT��������.�)B���$�p35:N�0�� �_�qy��L�A.�+
v�3E�I��q)���+5BZ�bjztU=F�֠ŭ��E��k�Z9	������I!8�mS!��p�Ɉ�xf�ni��o�/4Cn�O;�wx�r6!-B�@ơ���+)ieLn�'�pY�b�sx��^TZ3'Z���I'�����4Oo,��\�oS���X����۔��%��}�x2u��o)��ϻ��NI��O;:L�KOp�D�y�D�٢0Јr��e[��B��L��'�YJW���7�{)�$kWt�70�@Gy���抡рH�͸.'pƌ�E@�1�?f�X.(0�)k[��Ȥq;u9ͺ����k� ^`��M�7��,���d�~��d�W�$�2!]1���zp��ޗ7�汩m@�_��ՙ�z0Y U����3�g�����9�<t��/x��?� -5t���k��d��z�5~�c�g��=��71�>��
�KQ�S��i��Y��*'����{�j�������C�R$�<��I��g��q���a4ő��ט��-�.J �����s�aȼ�x;��^��ٮI���D߻�<I6�Ԅv����FiZ-�74+� ��%u�FR���sC���@k���p�o�|��"�y�'E!i���% âR?�sl���}~�x�ȷ�.�n���G��y �g�$��CI�˸�j�� D�Frc�������~b?0�G����~A"z�.�ђ�9�w<v͓��v!ɝ���aG<�}�=��=h���� 敭��KÍ�_r� ���%��;΋�t%	�o�,4�ԘJ�Nd���o��ؚ�p���9�M�c9-y6���#�E���C���y��H�X΃����1�]R>���Ⱦڧ2��}=О�Ԙ��w� �/��ʒ�%T��F�;��M*�S�5K#��g▖��^mW�hTO�(�|Ęx���W[e�� ����sŉ����n��K�������[��Pn��;{�U);\��%����u N!������'�Q���:���V��/P
a��jlz����?��1�ȃd���q�AO�Dyv`�x[p�)�;*���E�"�"E�"g�v;�C`Qݺ���k�Ζ�D�>��7��t�1��A�$���©��/�\��"K;�w�(bEK�;�f�ks:��-�Ycâ��c���vL�Ed��p1]�E��`c#B�wàwI�-����vU5M�dUK*ct_��Z��&�Fg�'�pX�v{��lEӑ�%n���5�$�K��J����n�ay]J�f�K��A����c4OIܽ��6�#�Ab=_l�S��'�b�a'�K���o�k�Ư�G�yLe��H_����s�[TL�N�<"�Z"'I {n�#9�ȭl���m��!���k���(�~�.8��l�q�>�SH7�#T{j�(k��a�:�po��<y�rL��.?��+�X�M��C6�U@�\��wΖ�%�X�kc���T�P����w�Ϟ�cf>GMϪ`8�����D�?�����r���ƻִ ��ж�ΤN�1��aWׅM)%��I�hPh�#b����I��w��T��U�|�F-�pb&�(��0��D�_;c��T51�1��Ѽ "�V9��A!�̃��lJ�kp)$�/���l3#���𙅶��`��%�������t4�x��/Vh �  W�G�N�&d��y:�pɵǽ���ߪX�^���z����l�ZT5�e�&�~ɗwE�-s�8��]�`��7��w������|[�7�³�"e��N:�A�",i�K��+�w�cYE��Znu�X�c�'?+�V4Š��c�2go��+�J�o lV�Չ:�"����O��]�x����~ɩ��t-������Z�v��I��E-!��3�zi��ZF\��>��*�*3`	=$|�׾1�\̘5Q�q#u�㵃��ݔ�ʰ"�J>f����6��sg�a)�YW]1<����w���EzOp$���5�抣��@_o���qv�"�2�h�9���� ;���Z�Z��y����&e3�Ls�	�����0��E9���t�8�m\7͙{퓾 ����4��� [��1::�"�yO�J:ǋz�M�{cvkYqn�Е���X�;�~��3�M8I`��<d�a�!���f#G7*X�"�
B���8�3�ڕm��h��u�+�.F��5]53�V��1���e�$���"��Ͼ9W=�E�5���[P�1(¡P^3Q���*��G�Mh��WT�M����]�2��5�� ^�w�IP8pǷ�v�P'��<cx���&�`)B�8����]��p�ƭ���"&��*��i�%]ugT���1��'��;���/Y����@=�-�-y���o-��.G�C�P��<2��Hnh!G��J�0�����M�q���5:�>�v�:��(��x�ؠ���nLnī�R�����1��㾿�D�o%�Vn\F= �]n�)銐��~��zт�����k��FВ���7�X,B�s��5ər$B�^�[�?��K	�n�m�%��ӌ�2��#B5����2ً_$������rq�������=�Bx�zK�QS0_vs�9!C/�(�Ƽ��MME��|p�5��m���I����<�뼈5�
P`�����;o��,ܴ�z�4V�,'��	���|dҁ���wA�v�����_O��e]��N��R!H���i5f�C1�9��k\f�W�S��(��k��J�#|J馳{�{�p�&2�K4��<�Ԓ*��H�.>q@u(����� �ٸ�;Ϋhcl�dd7�7Br�
����`T��1?f8��"7�C��OxU23����	i�����2�_���y��� a�      �   �  x�}�MN1F��)�A����a͚ �(]T��p$n #3�:��D�J��/�_px<�.�D8<�>���������ux9]���&fK��8ݯ���Y��,g��m/�~�a����l
�	εqnK�$9q��ηq~��:�p)�`��Br:��)�/�(����-	��,�g�w���6n\J���K!M��&�Mmܔ{�:_�#gY-�,����K�X�]��Q�������׵X�Q�6����`O�^��P�^��Dt� �+{]���Nm r�#\N�۵T��=�s�l9�3f�:��� 򒰻NEtA�	]���=IБcN��&굆h��&���գ���N'Q�s�"�f��M�b
wL�b-�z�^���;c�#��      �      x��}Y��8��w�)��J�����1p0��5m�e�V�LI$V�,�6Ƨ��S�����W���>���u����w��6��o���|f�-.���������=��}j{?���Z�J[��E/��/��ʭ��gГGk��対��u����	]L�{M��_��k7|�5�b��Y<?��I֓�_�k1�v��i�y���z�ty2��O.qq����|z��Q���/}�nN��M����}?��~ݰ!/Q�a�����������k����W��j֒���SZ�*{s���V7+8�R��O��.]����o��@�>>�HI�o0��{� 	4��9c~�t���IC��aU+�_:�qӦϮ�1?�����|���ŏ��cv��V�=��1v��O���UDti�n���f5���~F�uӶ��0GՂ���M;4��S��W~t�_�1�E�g�bα�g����*�oϊ��o%Ţ�~��G�d}��d����C����B*j�b����B5�Ķ�Y�hP��ž7�eǆ�;Oj(���&9�^�>l�ߞ���e��g��M�$R�M{~�֣�����V2
��i�][�����~���!}�w�т�4c��1�,��^����vV�K�&|�W%���.���vu!�A�=d��#ߜ5��*-���|��w;: �=���Fj٧��V�y8��T��'ӆ�vɦ�&�_���L:�W-f��J�L���o����_M�&j6��n���7V���ږ���F��5zkR�����p���u��h�ުon�@��6���NwhȖrH�o5���n�9k*L2J�Piy�/:���N�6���콽���{������*F$kX�C0��I�Ȩu1I۠�q��u�"0����޲뷚�Oxo���j��uɛ�-��&�:��F�VT6��9k4����DI�tֽ����9&����q��,[����=�2TFRy�Z���?�a��@f��|�[d���k�y�AF�yk���-)	x}(�>�r�1U�v!��o��ǅh(��nc��F�ྌ�~)�d�ʥ�%y@���7��m@�v�1�W�o��MrFd��OC��3��p�o�_Ɖ�����bb�z�׬E��v{S:�N�´a���%Yk��g���ю��WD�/�M#�h�U��?�1_�1��.QV�M��,�c��vI�DY�$fX���^�єQde�6�.&3|���K)g_!<\�o�U:il�����HhRbTI����j
ț�u���j�}��C��ȊG�F|v��^�6ްh�n=���o,�嶝5�ߣW`��W�_�ۓ�w�p����SQ�P�3��M�z[b�^ʀ�����֬���OTKM�X��X��x��KQS|g����=���|uC��7�� �cꈱ�K�LE�F��' �����9��1R�s;TD��{L�L�}����Ӻv"Qb�|Ex��?��	v�2�?��S)�|h��^u��#��W��z�64��={9��?�s�-�g�s/�ó�sQ��_���q�K�����ӡ���BS�t;s#�Y��%�.�(٘���x)�p��=�Rv�h���(�(�Fz%�Bl�9m<�@K�V4�,��Yi�ɀ�[�F��ՔE8���F`��e�:xt�6��|/�Y�Ȟ��Y���Q�jո&��cس�3��¡�	d���$gr��v��G7|�'�`G��A0IB`�M�s�작��wJ`Y6�x��
�r�lz.�Kuw�{��a�4�[����\���8�2IyW�jT�-�Vץ�~�mV�ʆ<@��e�T��*�0���/Wgĵo�D�QE��zO��^�>�Q�_v��}gq�Nv�?[3Ǣ%��H��B!��(m�9�J�ɜ[ȖB�N��^#n��A��nܹ���e�&�U�#���ۗ'�ld\Xh����Gs�<���@@�S�PG�0�─�W%d�Z�/Aj�Y���D�`�_�]>���w
Y��9���;�K�ń�P��]Z��-��f:�T(�Z)F���������MZ�xq۩����*��2��3�}~��S��P�����
�!�[g����:*K��D�i���P�k���f)!Ň�D�QҚ�xG�	4���6����fQܢ�d�x��Fq~1żK�5e���*�.��bЇ����х|������~���ӯh-���?d(��ܖ]��;��B�|R�\�
�د��	ŒCA1d��}�`�	�y]�XP9 �)CQX	>�.�Fq\%��Lį%����o%�0����+B�\;<�[�2��L��ǔ����"�:��ǣ�.��v�җ��9��X��'��f���U��k��ͬ�xM�����d<I�
$�{��"����Of��������[�ggGx% c�SC�֐H��������LUyw9�y0���{]f��ܒw��*�� ~��Mنb�!���(�rHY:A�M<իZȄ�\��̼T�Zl�1��%�/�ԡ_}�ؙ�_��=
	h�*{�f����s���Jg�
����д���2S�)�(��J�p�ǎbűS�!������
�]^8$V�b�j24Շ�c�o�������\���]ޘ%�l%d�4��f��cG8D�f�A+Y^�SB[�w�()��E���=�{F�	P�k��W�ޭ�@|�6\��'ů~T��X��nJPZDJ���� �,�ʢ"�f��MI�����q��|<ǵ��y�N�3��"�+E�d(��4�@q�fx�<�-&u�W&)���4Q�+ST����Q9�"W�g�����:���c4cq�����Q��LD5IaF8�g�������Dj��B�2��h&ě��H�Y��\Ѡ��n�����]�Gb��L�����+s�9�b�t�%t�bPh�������T^)7�9��)���djBDJ>^S�+E���.Nh9�-�[��%.��i��1Ų�o7䐒��Q��m����/����QZ�.�Z�ʖ]�id�z�\��j�O�c�
7��xq�Vo˭v!e����y�78)
�]�Ď(�Cy+~ޤ��.�����t�,�-��T���ވ��d�Qw�c����G]����<�� <�*Ew����%`��!���#����=��0U�[�P��>�C����������LMݽ}��j�`ҁ���)�d�]l�1X$�U�~u}�B6���-u���zr#s���~@�Jȅ���&)���	��9`-w�^��yXzKKa��
�充n������䜗����F__Ņ�p�%��Y-]���'�C%g;{L��6��`M������\0k!3�QE�]����]S�p��\�ZD]�j��.��ñ5O%F)�����V��=�2�VwF�4����'�"g�����y� ����������ތ;��ш�b=���I�J��D,���zTքRU.E��U�;$k���������$��3�줠�E5fA��<��|a�

���������;N2*�_I�웽��q�Q�I�_%#�vα���10<u�>�Tan�냖Ӯݨ�+� �G�������z���N�SU���7#���Y�%��ȗ��l#�r2�'P�]T��u)s�1�=�<*���rt�Fcۤj5�T�������-�%������1!"���� 7�~9��D_Q�-(��KX�\���!	�J8�~��B,-�lk4�54���1��^@�͹�����dkn�#��Ѭ5����
P��^Y���[>�R�"o]h����t!�	�v�/J���P	@�OI��R���x��󞳱��݂�N��~{C_�kX
Z��-/-dӴ�3WyHo���/�j���L�1�m�����<��M����GS���-�ε
J����1"�qr�k1���X�����S]��oܺ�X���(�Z�h��8�\�����Mj��f}��t�l����43zXݸ�<ƽ*7�D�Ƀ��sۏ�SL�Vb
.���9���@M��Z��X����Q���"���a���#��m�k�~����Ң�Eaa� �g���U`�Z����H�= ��:    ��4�Ҙ*�"VRd��1����PYo�R�
���,F��9w`�Ձ��c���C�ݵ��$*�����ͥ�=	+1 ��$wG� �k~�ғj�����N3�����G0�0%�H��5�J��'�G��X�T��R?%�� W���S3����E�/��""w��0�����`���Vb�T���D��ޯ�ə�m�+\�y��C��-&}%�������$��g�@���η��+rH~r��Nֵ�v�$��
�c�	EX9uˆ��F;s�O����ա�Ť�!�Y���������ݬ�D!��Tb������Ģ�g�����e�s6�n�A���V.DPT�W7�L��߹����1�M��j�:P��$��8�x����H�h�i��#ۯ�"��@���"�e�z�5��8�S��a�W�"[��&�kJ����=��?�exC��!]w����d��ϝ9��ğ���mn}(�g�*� ��ոi5�Y��f[�M�+��KH�x�e��.`����c����UDN�N} W�h����+ l�	����<� �	�^���q��tC��|ȻBwl%%E���\�	w�#��RH�j�˸���N��1s��<�JE��[)X�R9�O�&9���F�V��	GѤ-������Ǳ��P��]�Y�'lVd[`	������g/|A�d�h���*!<�'���莉�.�3!�K�\����L�1����K���3����F�$�&Ni Ƀ��?��xaQYi?R��p6;�A�M=�0����3K��]BH-�1���b� �r�C�R�vA�) 2�.��b�q9W�w�R�.j��C����̌��L����LݵA�%C'6<����8���I>y�nPAÂ�/��I������1��2J��\�:-/<ZJ;96�gă�8����?�2�u�DBX'�=�V�a�519�� G#��O�fS^��k�M�r���+M]O�K��,Ph���1��|���s�N������U�C�#;���D���֭l�Q7h�]�'��a��q�I�Dr�Z�� >���Eil�nIKv�o��a �t߆^��v�F;���?�Z=��m�P������kF�����/!�M��[^E�!���J�Fo[�0��"���)#Vn%�%���k'��?�6	�����P<d���S����4���Gt��u-����K-��)2�qXN�f3c��������a���q��?:$���+_�A%��,=��aeVed}�D�J5����8�m&3���Z}3}� �hw�rV�JQ�ߔ��.�0��z�Lkj�Wc<tH$�!���~z�@z����S7�	�w������ 4�]��p*��&�r5��|���ԗ�1���f����L����}C.�����D��t���x��U�`*Z��:�5�ޔU3|��W���p�@\kn�_FŦsጞ
��?
�@�5C�$_N��5���b�̠�C$�{�� +�?6zL�Z�M����>��k��r���F�A՞��2�OJ@s*��9wcU���R�==����Ԡ���VVҟC7v	V#"��lѵ֗';u/t���A	�Lf��#_1=���qA3�Lb�2q�Ŷ��<%�vŦ܆]#���`7-k�>�@j8234�t"����9h((�?�l��G�c�5�L_�J�aC>9�E
�0���ic���(�`��el��ԣ+�X�0��7���
��Q|�j<t�T��×�0&��ь(�fb�P7<��:+ss��D:ލ���ߙ8���`�\5���+��_���%�&���u�y R�����f�T�b�������T�J*�9���!O��g���W��ĆaK@��N#<)�la9��W�-�D�rgz`��򇇡�i�&�7����>���_���3ʹ�C�����\W�Z�:�0B�lX�ݼ|�<�T�s��a�+�D�
��C��� C(O'��uΕ_/���t�X��=�z��N��0���뀐��>@Rgr��@��9�V���A�|1ǎ�JT�T,AFB:~��}���0ݞ�['����I1�/|0>p�c��GE���9`�U�&�yU_Z���.����m�;��=�KH9���Uf�D�����S�̣�(W�`Qk|Dwܻ�g�d.���dJ��8�W�}�"G��{l_ �	��[t�S6r5��k(=�yw�R�s9�����p���`iڅR$�C���/0/'�y�&����p��0�ŰC��;,���\�`�Ǩl�G���L��v���i~�lwo?�UeU$�^(.�=�&�1�\���[�&�3P%7�Od\W�hFY�9YmN^q��k2CѲI��$�c��fE�8�}a�s�ڍ�,>3��`e����(,�E#`rO��w�:t�6�G�����t��ڪ��;�
e�����j"Ķ��;w��q�FhN&ء�	gr]���v���9߆Qe�܏m�2�vڌ·�ׇb�������}©{����4^�K$�H�+�-/\���L�P�ƌT4 ��Qn/�/v_|�-�S�D���04�+���~&MG����Py�8�l|�d����� �i�&�.Vk�}�ʪ=��8��#fHS��G�j����rZ��+�4*�ɳ��7�p-:�CJ'�7�p�t����#q|H�FL��Ҷ�����̷�u�$ b�48�����?|`D��L-m��3�5�6�G��N�������K��Š���D3�ȴZfH����9Ԁ� =C����x$��5��<&M4�&Z�@�"g��J�1}x�Ĩ�����t׌�̈́`�k�h��qsz�E�.�X��ad-��7&�_��0Mf��a���u�!�|�_붮�K�6\�}y$&�P��%�Nx��V�P{0�`�a$W��KP�,��|̥�N7LZ1���u ���ϔ@�����h{v���3:�F��K�ч����O:F�9�k�d|zb>�H�}����䢋�C�CA4>0�^���w?����+_�J�ށ4�+�H�����;����++4@�@�bӡ,�B_��ٹ�p����C�x[�LH������Ȟ�DL =�k��^~i ���=��ѝ���c�"�k�;�Qm/Z��@�����h;�����4���~.\N*��wh8	�5:�����u�/=v�w��eQ��w�SQp$���F��Ì�:Q�k�&2Ϧ}xO�-�hXC>D��Я�DJ�.�s/����ӵ�g�N"l��|ԩ���b�ϓ�����]���k	�c��l�b���6��u"N����ͨ�p�,�0�
#�`&�m*Fz�U
#cƉ��@�S�wL��e�����!|�"�j�j(�}�����z�_*`�~�����Y�~2�V�?jf8�2�}C�O<��F��/sH�`��v�=\�!I; =/oLM�꠸|G�b�Y�M)\ٖ�7	���� �5_�����N�p����ƴv`���_7�x0#�@�u�����9M��V�~�cs�՘�C��M�����EVXC�Ծ��F��0�v�����ѝgb@ ��ͤl��."����"7�"hi�q��r��x.h�m��f��7�t��ԧ���L�.��D�|c�d
�2�鯈�A_����L���OF��NN�gR���Qh�U�ε�����a%��+�H��+��=�r�y:���/r�*8���hO#A���C=�b��Q���Y��w$wJ>"i������_�?;����P��W�i�_��Dޱ�@��չ���'L0ܽ�!3����m+�m��"cX(����Cq��̐��
$��5^�Qܟ0MÉ4����싫���Ό���ټm>D(
?U��'w��/Mt=\�O-"c@�ӽ#��d!qq��qeO}:]h�!p�[��K/�zl�y�b��/���
]�r�~b���� gsC����D#	�'b�葏~��w�z4¾�<���*0CR��ȃ�.M�{��J��$?ρ�u��R �
  -�W�;����<�5,���@��]=f>�/�p�#�g!������|.v��FN��WUtQv�ţ��<���'7�iY��|�������J���N�m���d73�� ��j�
\�@�{����X���O�:�Z�n�P�N����?pqt3���\��ENC��ᠬ�/��o�����|��|�����<'�c�/&E�ps7�ed���p��e"��>��p���z3����.z	�v1W���d�i�#4����u]��H8��gK`���v�_��ɩA�6��:Lfh�F��P������&6�/L�� 
˗r�}>���X������a�O�xL�� Vf�M[mʘZ�F���s�S��S�����r�&p�C�}�w��p��d�q�t�j	�-GڵUw�"5��8�
���*�����G҆��aN�{�sK[0�(;L�=7�ܞ�]0B!�@�5LƷ���0�b�G�:�O��)�_��u(bϥ8����s�+�ܡ��N$���"g��Q)C3Wf�{[q���|��d�컙�u��N���utZӣV� �pl��g�~���Z��d0�-�F��;�P�AG]1}��)(��t�m� 2G�!pǬVL�56���9Q��%$j�|�VO?��n7w�=�6'3�"�ak
~Qr��5-r�WK�_j,/��]i��mE?\��M��7���O3���4��é�iA2N\��<�ʭ_����i8��"��B���n��@*ӊ0"��~�.���ݷ���Z8����{]&p�kB���h�JN-�;M�k0��k��z~���W�@�� ��ِ/O����PPs���,;�[���<O��6K<��k7���6���oJsc���P���B0Cw�*�C�o�h�u�����A�̚l��D]
�.�
긁��B��Z)'��!n瀛�U��W��
[��
�e�mr�z;0�������L	����H�a�Î�Pn`��ͷ ���=�t��n�{t��=�so	؛�rP��c�Hs��ɋ�F�+� ����Iv�A�(U��^��u�'�n�1Ok��X���lj�3��G����T�^Sq�yn�f5�g��{��hz|��3o�׹I�q.�_����3 g���wu�O������Cf
�(��K�t�Ћ�n.r���I��G���KM5��IH`f^�L��lʔ;�}�n�{�eb�0OJ8"5Tnu�3�ȊЈyE��'�m�r��UN��&�}�4�Sx�c���ELy���6�*����e�jځ\�O��zus���S��U6������Ȧ�"�SԼ�|���w���Ch�!cK�_�8�oT��V�dd{��'0{̤x����Sʷ���.�L"n����d�ߺ���b���t[^�Y�q@SZ��)G{�~�q��,j��L�C�Gx��'�^(�q�\ç�L��fh�i���KK��ɜ�ڷ�ig�'�ü�7���f�Hw#����p��=��6�<Ą�����+�Ef����	0�	��m�t���}:��h��#iX$Ά��[1I�=�Z����܄�Ɐ���S���H1$,|WM�tu��s\���ĭ��l�aXB��;����$�ANiW	��r�>�%:t3O;z��E�\��J�~�������ڲu�P����@��9�	%�D�#��pMS���������~1?�3�ה�59�!�;��/wHP���ڋ�h�`"�u3(�R$�4G����A����17$��M��������C�\B6��|�ã$vid��p�ug�B���z��<�z���	������=6�M , ���e	I]cX L�\f�)�z�WN�0�2W1Z5O��ː0ڌJ�����^�����������!���I�]=�\�^����e����.G4���U�4D%4����W��X�����^���_�������X�9f;�i����v��̄�9��!<���T�5����<�iRe���h�f"�o���R����?K��]�9�6n.��c((v>�DN�Ǫ���*����GXNvn�����a	�*9)�z��=��H��ۼp\�*��r���6�� f�G&��D���dv`e�Tw��t��卟>�Y�ȩS�S�&S���[�r�Se��w&f-a@�e��]�M׉^��䋙= ��n�]e��6�j1_��S�["	%�h"��_d�(MwCf��'}z��h��cj3�}"-9׆�w��FV����?���2�����ȕ8YMÆ�3�3�g_8Y��3�Ҙ�y�Q�Y{b�
�NDn{��w�]�����`&IH�t"���=8�p�&�j82X���bD���� �&�3�(>�e������<�	xK2���u���i7<��oۖ��Ԉ�N4�r�l�L�ji��\M�@4���.#��E��pZ�C����l����p݁��Q������l.�=d^�����v:�^�{�2��8:��������[��)���
�����b�9Z	K7ɋ�4���{��	��vk�ʉ��Y(�KƄ����;��ۿiy�0�\оM4Ge�D�sCi���_��8���W�lC��mc-���;5od1m�>�\V-��)c-q0��u���:�oʕH�%}�'sa��>' ܪ�{3$X�B�h,v��ķp�����(Ӟ�K�j�S �����[-M�)a�Ǘ�����^�ר�)��K����~���ie�      �      x��]i�.!n�]�)|��`_|�����$z13ѯi(ZR)�X��R�ӿ������9�W����?��F??������oh���_��B��b��!�������/�o(�ZWC�EZ�H���x����诨���*�Y�֧���oh��u-w��G��SBy�7��J�6��/;��Y��[��J���k���|kHj��:���q������F>��e�|Ƭg�F���8]>6�KC�҄e����OA>�ۓ�((��Qi��㓊¿��e�c����H���'�����ϝ0�$��sB�ך�Y3�=�X�6��s��1-!�~� h?����3��7�;ߴօ��b�~>8��q1�{����!�~�����~��~q<sԳ�,��τf�x'�D�x/Ov>��UVcI�r�Xf�}q*#.����D_��s�'
�0��6��=�?���l�(鱴�9��	���hȴ���h�t.߼��K�7{�R{U�R�����F\knf^#Щ=��s����_k�k,�U�O��-��*����se5I�J'9�0��K��d;{U?�_��k����ib-G�7�߼�R�	����=�y���a�SX�,�r�]`M��SXJN9��G�H1QXz�u]K����g:�q���Ϩ�(ӽ'��D�l�t���ܞIwi�3���Ԟ�0\3�+Z�荴��5/���] �*s�����:a����J��áC����m(�U�qC�趿|���_��\^�}��$�S��t�`�
�V$�[�i�.&���6��-j��������y�y�ұ�tUCH{����h/!�*�\��]��zO{��@��3���֔���ܕ�<��GѲ����˰v%��'��]ڧ���Y�-Kd�� ��0\O�o�K>w���.��{�Λ����Ò��g�[C�F�Cb��P�SI �̻oa�xi,ܫʿD:Ʒ��Y�V,��`RY�����e������q9p�"h��aB����m�p��k�z$�Y$�}�F�|~Ϩ����0�7J���4d��p͓�
�a����KRQߑ=� )��I~�^C>a�����3س�˲���E㼤�hp��(�8,-`xE׈b��z�Ȍ}w�%Wyt��Y`��!HE�D��6t����P��YIt�[:�8h���з���N���ՆxHdD�8��3J����ƒu��ub��>�F$��;H�˙�u���nlQ���(���,X��������q�Q�_��80�H"�=�l=ҥ�Q(;�X�[�b�p^��I�>=�!��U�P&��FBylz��F��z2�Y����Y�/�%������ࣤ�̏���+\����G��;]�A^�ؤ ���%�����.ç8�d�H}�o���~������^���X������C{�
Η"�Hg���nGiYT�8�Rv��ŗ�ȁ7�Y]�ўB��3:�]�~C��=&_'��h{8��佷�-mq���s�^��E~ֹ��8�|^N�%1�Am=��oX���{�UCy����	��+��Q���8x���"J)����k?`,�B��s�.���Q-ѓ$kF��{�2��<J:�&��p�E*�4�LUݤ���`1��
�%-I��g���}�O��I���RƖ��M���*K������$y�H%	R��Fg���8*h��w�#Nl^c���(+��2�Z	m�~Ue�#�Ϡ%�N�Ex04Xɶ�U@��D����r�h0�W�>,�o�55��Hn�dB|-Q&ѩL{V�W�d�A�h�B��ʀ��䊇�^�1i�` �?)�wd�D|�,�\����l�����D�%&�_��j g�TE���1n�;��׹M��H�9�`�E.'����6��&��\F�G����N���i�4�/��`�77�⏝q�2�J��xr�1m�t؋��d�|2�[��%��N<ͅ�{0r�-�톱�@!!�?���9{��C�p0)��I�(Mv�&j	� S��c��[��M:��H��q�O�W�I��"S%�����H�w䎺w_�j���s��[�q�B�ʹ��E�p0�9��*�apWW$K>�8"tܑˆiW�ɡn��? �ra��0�N{.��'���r�L�`��Rܷ�/C �_8�"q����%gўG��r1�@�l�ĺ/h�/6��P(�
JU4I�$u�h�M����>E��aE��䃵W2
P�\N0i�̜�����OH^��RI��=��|6�:���.���D\����/Uu��P��q�$�F{��`&@dt\w�</�[�А�M��7�0�������-���(�Oƹ��ܡ7����4�&o;�[��l�mE	���e,wh��ܡt�LE��Z��1>���|�{��T��0G�*KGI�b��8b���k�GaQʒ.���#j��O�t@����ǋSJ��ޭTI�����mr�j>��J?~�v���	)���bc���f-RP'8�dE��"��*�>�PK����X/����#�;�d��o5��nL��MB�ˁv����nU�0�4yW��Lҫ��q��⠳��>7�$�����s04L��Hp�w�̧΃M�s$��ʝ�3�1��f�b{�\p%?���J��m�a �t|'��YMJ,
�'b��s�V%d�*'����8�q��]��3D�D,(fF���%P��J��:F�GEO �>�ްNUb�te���f�~&�yg¢c�d����<1K�p����u���\@.l�Zڬ۩N�OoC��$z���Ў',�E���.)^��l&�£s�.3���b=�����K^��4S��w��׽�mp�Țd�_R��(FI�༂+�Հ�hc�7���
 u�#ݘ�������'��d��� 6;:��v�y'g����/"����,6Hm�&)��nǘ�JaԍKZ�ģ�@΂a�_Fg�-�1����aV$�`��t�*�In�#\fC���H! [3l��jls"R��(������&�_6?���ƚ�9��� *�.�
Y�C�<M��	�,H��3�v:�T�����}�X;�ao�;���s>���~Lq�̏p�,��Y�l>�l�*��#A�� �l���2g���2�ԭ�|1a���V��#a!Kc� $q�����T�;$��:�������a@N[����h�b�!�wJ�Pέ����:硨PA�����\%6m=]�S[T<gR���V��|9��0�bK*+���B,R�N��ܺ�����*@J�00V��䡄�fʽC�ygR�d8%V��bϠ����u;�.]�1V2!�i���W�� �)�� Z�r�ĝ�*��o�(� �s.�"� x<-Bp�$f{V6v�1S~�3����b�Q#�mM�0e��ޛ�n�����T��
!�u<��m����ޔ��� LnɧT���9[M�x�C��t�%���dHJ,a	�IR�ѩ@!%:�<���e�uqQ"��+�E-�c-Rô��2�i���%�(Z���͐���?G�5��DNrMy�;�3�`�n.� /q$D)�S$LA]H y �=9�^����*�N^R.�.�b��YĂˆ�,<�������'��-Įi&4�?��C�yQ��N��<VFcK	0��X�]��s�(����h�
�xI*������6��.DK�^��y|�r��:�I����0ŝ|z���~�c
~
@ߏX!⭕2u��X��m��=�1"5�~�$E�ڪ��<ZLݯ���ŔD}���h2�p)�?`-z��:)���YD�3�w䂑���8�tZ�C���):e�-V�Q�>w�S��E��D6�>ט1������xm��C4[+U�QF��7����ɫ�M�XD�u�ǍpFðq��i�w�sWׂǨm����$�x���E��%�����E~P����C��S�[Y��`�ޖ G�Ix+lS���Uw�D&����!]/�)�!��s|��)sEK�5`�ku�h3��h��HX����l��&~���<m���#�M&�=�Y٬%���@���7�:$ �`�5	39G�k��H��    �`_HE]�Q%�Z��=7�ҁ���	�*����mf��i���|:�eu	G��c};���̗R�%$Z���f���"�A:�)��F���;M�5��dDt=��j��S{�lt�i��ܵ��( �ͯ�|�ԩ�_\̺��^(7�#r�%DJD�Dk4�$׵e0��z;�v4���\�>�-~�C@�1.�l@���q|	M�N#/�
�U�3��cb�?e,��$�4��_�g�<�g{�!)^��(ǚ���O��GSw@�I�l�����(�M�儊'�]c�2�u�a{��r;��2��� ��=�>�i����O��.~�YD�jq�lt���GƱ��DO0�Yn���{��;&��8��y޺�3q��9�Y��Ks��a�EN���H�n�+���n����:�o�)in3��2r�Y����s�
�&A,}I��A3c6���z`��88~�u�o~N�'	u�峋��p^�D�/ޅ�!U��X�Ц�>�`Z���eK� JW��t��_�U�ڡ^�
C�M�nv�ǭF��\�/�u-�хV9pT� R9�^��L��JF��ް[S	��2��R���]� ɖ���ш}L�h8V�h��;r1��..E1�i��Xv��VJ��5z��=����$RV� 3rf��G�M7��o1���c8�h$�nR��cd�'bm�h�\�Z��;eD�P^���cTkr�XS{鿥��4^��᫽��x���bSD�B�A����Uih�T�^�Q���q�3�强q��B��&�/U��O��P��"_.�1=��1YC��)�v�K�qB��i)�wz�U�0
�}Z2&9#�좻�>�{.������!�sfRL�p��گ]��L8n�A�mz�o��if�+.�։]&���T�Sܭ�y�jp]F�i8R�e��hRi`Q�о|h��fv�IU���������8��4��b��㛬
�6 ���ͭ�q�ns��g!M-��b'aIM��sN`�g�`��hA����Z��s	�j'�r�::z���Κa�)*tѮ5W�O08�$XН:0�7k��*�A�N֐x�0�ڏ�۠�c�j��h�ͮ�P����s��|��蓕O�gk���E�V��$5&��f����a�:ᗙ��ŧɂ���fG!a��b;� �[��������*�w [�֪��� ��0'���Os%T#���8s.M2�!~�<����[{��@F�St��ͮ��
yJ��mu>�)�hr]ҫ�$ѱ-2�� >:h1�Y�P����Qp�.l�v����js'm����p)��)���G��|�A�7�ds �ak�rE�j1���G��}���\�����,�����-aV68��}��\��X�udqnT�5I�6A�)>Y�1�{�d��l᥼�����4���U+	c�~��+<��Kͺ��()"$�'ܚ�N��Q҅`r�i�3s����+�_���@���D�&{+DW��hbGVbY���Ul�YİH�@j��1�kFH����`��C���=���4�.��l`c;�fq� 9=čxF�4%@6�ө������E���8�0��lƖG��tʥap?FW�/ԫ`�yp"|�����`L7��\�['H�q�\�]�ϭ�b�����Z��D�����gAW�r��Y�Э ʿ.un*�[���9�����r���Gd��􁆦��[j��_ΘW���Lft6��%�'�V>�\��s�O��]k[�u6l@�R��bf�Y3`�P�x�<��2�ߐ��wa�4�\q܍z����tI�J�@O�)y�Kc
�4�B&� �h3�e�u(GNv��`�V>�� ����_nT�jM�W>V�Хe\P;�EHcp!����Q	rV����s\��u]?C�th�NJ���:��L�rD�hz.���e��r��@��݇�����
��sL�TB�w'
��E���i�'t,ت�ՀFSvG�i�K��A!��;e�����m��%����r�˺�xV�r�A�������;4�t!���;b�:k�MTq�"2�8P`>;����%/����r �.�uЉ�KDv�h��B���0���_�.�IU�d�����*��-��;4�$�zb���/ܬ��+D
��Rً�z���z�a������\@��Au�t�6�c*@�{[Gd+����>�j��wc@�������j�t �e�E��^	%����$�O8nm��,n��9{L�����b�z�~7�f�&�Od���Ka*�7O�R���O��DB�W���oo��U��Ӿ�]�bˈJ& ����b�R�������L7�m�xD��z�ϓ��j��C��_)����9��A��"r�;u4:N���KI���	����qbtS�BF���%��l�"��O��W|�x���f�P�3�u`�����)��fL����R��)�at��<Бh�ƃn��cO����/ ����+�O������v����b\�8&fq��狧tMb�l(5H��O]b!������}ռ���ab�p�gb��;)���M�2;�w$�G1���SxX��*^��
o�D��p�����n�Ng����I���ֱP��������4�iS܈(�Ů�
��c���Q��� �s���Ơ�6�o֤-�����Xv��&J<�O	�������q���7�Q�7]R����P_񹏐�3E�e���ƳK��*������{tU�D �<"�|9	�UrAJD\��`������f�-��l���	$tL"��lK������������٣�i�oq��L.��'�2&h��!o���M/XWEݷnH��r���/�b�\&�X��V�.��K�(�K��	�����2Z���C��-\-P1@����V�����p��^u 8�����g?f!��@�����H�� R��}3���%�ߞ1@�mj��2VZ���o&.���2�ˠ�2&��S
N��[���	�n��V�3���f�MQ8�9��Z�2�3�Պ��xw�R�.Ƙ��zx���@)1f�䇜z��Φ|�����E��o�<uYh�\+&O�8Җ}�[�t�c?Zߡy����%����⭕>̕��y�����l��X',,�C7��I�P��oϓ(e�]�k��Hλt�FZ�6vIt��C���^�N��Ҳ�@�5��\B��:��)nK��qˀ6�cF�K:�u߫l�fĴ�S���Wh8@i� |���R`-3�rϿ����a1����8:s�,�y��^|WP2L�H<�#>�o�8�?νs<���K�)0�9�z���htZ,Y�|�a�b;<Wza`�P�9O������'�����^��M&?β��33�=�W��i0e`���J>Ik�h'�l}Z���f�Ut�J�B�j���|���u�s�'�(�F����6�є�?�f�\�o[��8Ŗ����>�٭͖]R���;�p{�ES�9�a n�݌.�Ÿ9���:}����s���\�m�!K\�?7��uU{A�'x��A��_�-9�w6y��4d�|�&�%��O�q�n��JPAOՍ替��`(�SY���3�� �%�z��<�&f]6�b@y����09�����9�33{�ɗ>á>g��F�����4�����f�u)����/�gn��{�(5�S�M�灎���7�x�ӨL��[�ȳ'��h����^�pЖisS���P	�%�q#��מ+݋���ozt"�23�A�7A$X��X̢r�>7�G<5�϶$����!G)��[#�a��P��B����R����(@\��'�u"��s�U�+��<S�
�Ykc�C��N�^@_]��[-�1��/9��8��ɭ�y���]���_����S� ڟ�����?��l�G}5]�V�ct�>�媈4���s�D��|��!e=3?ߐ���\�s���_*��P���vǺꔐ$�ʪ�)u��cԀ����Wp�Eg;�}�']z$�$���F�FuN����}vRa� �D@}� �  ����|�:���ž=[��ͥ���΢�KoI�r�,���M�n��5�:�UX����Z�D�����K$)�Ae���zǺb�I��_Ւ�S=�e�N����4��AL�|M�����o��53�NĘ���/P�[�$����eW�U��d�:h.#�ب� �&Ή���C=��7�\��-����԰e���+�����n|�q
7�wͺ`�R�T����}xZ�ȋ��d�����8c2A��;�Ġ���q�B4d4��^�Ć�NEK��tw8T-J��Ϭ��O�J۪	��l��:^	�&B'�o�D�"B�	��p���n�EP��^ ^
O�x���4!�| &z�b�պh 8��*��J7�Iv��:�)W`]=I���O��Kͨ�3����8�u��07�,Q�v���S%k���Y:u��o ���S�����V��p1~PW��^�g���ۯZM�hQ���8ç�85�ª�f��#:��L��9~n.1Tޞ.A�=窛�-���������[<opI�֘�?�a�陒��:5�u���ސ�z� ���@�!�\;m����Jt����~L��6k��[
n������~��1�_�b�VD�j�dY�m��M�8!���%й�Ӳ���I�+����֒����t�G[�hsYA�����*���?�D�q#}7bC�s���}L�x��I�µ
�k)�IG�楷W8u���}y��h���N�+�~��Б}+"�N(��J4�?ܯ y�D��u�P���0O`�fy|k]��/��Ģ%w��^�U*�j�* u]~��K�vpd�bʝipz�k ��¶�nX��y�`�'o|��߫��^�*"���4�����:���?s�*��sW�a�V�&�q�<�}�r�~��ǭZ�A8�bp]�<����(WZ���p���˸Ar�*�.(l�]1����v��H��Sw��񛺊� ��j8���� �랻�v�&)[�Cc�L��Ǯ��6n Rr�wV7���Vc��a*;���x�Mq�>�f��7	l���4���� q ��ZG#��H�����N@y{��h"��׌��,��S:m��������橾u��Exm3@��/��X�n�=@�t�l�|�4��jx�Q��HI�1Nc�~���Gw;�M�`��q���r����q�^��yAj0����TH�NpX�{�}��ْ���q�8�R�i��;�l8���}
(چ�6��ĵ��y�C�|�FK�@D��Rק�X��^\��8g�3�:[�H��k�"��&+�i��-W�����`
��Q�S��Xy>E)1��C���G|���;�FѻP�����~���SS������~ܲ�ɡ,*goA!~3�"�m�"`�Gy�-/$��n��0�r�C5T�m��O�V�ӣ���"M�'�f��&���'�/��J��aݎ/J��g��G��LL)
<�ٽ�m�q�_�#��"o�7�"���[
�����p�;H����TlU�>�TH�	���zI����9nsr�,��*��I�K���c��uq
!�og�.U���4���m�V������+��E8�N{F����y�ڐ(�IOT�根�k�"5i�s{�Um��H��vl�R���E�n�)��@�j�#~��zU�"a��܊���ܗyj���5gtV5��T�l��ҭeuz��u5���W�c�u��e$y�u��[����+5$U����<�Jw&kc���Pټ��|q>�ٰ��4��	�aJ<'7�T̀�m�c�Z/��#c\v�R�o:�$G�U�Q����O�����-�f�Lݲ������F�4�/��A.���+4���?��I�LsX	NQS@\p1�~4�1s?W ɏW�:�����kD�t q�o5˞�����m}��~H���KV`�@2��m����~��?ۃ�      �      x��}I��8����)|�vp��x]'�����Hb��ݛW�O�1� �o���������+�����_��+�����g��t�����U~m�߸;-�}�J�vY����YV���ZV���LljY�/������~�}�/�����O�������tV�_+�Ws����}��_~����x��k��e~�8�S̆�k��tݿ�������_���b��i�Ϊ���m�+ֶ��4����e����-��+�{��w��Q��E1��y���s�ɮk�o]�a��Z��򻿣T��Y}[&�Sj����5o{l�.�?W��Lk_���$7�[�о�u�~��j�f�,�]V���ߠ3h���=Ү_�X��]�7	&��ߒ�lw%AP�8:���_�!^�\�ӹYa��5�_$.�^�:YI�f���4��r9�b�#^��o�Bz���^�x塟��
)�3^���K��{Q�R��&UŪ<����đz �K�nm\�_rDS�k��x��n����O��V�d���M��6��=.�e�7H*+[���&,A��ЕMa��a���{�j5�~6��-�
+��1��.{�D�F�Z�=��4)O�)d�y�#���זYy�Ya��rY�u���1=��ׄv�u�<����]��v"���!b$������={Ë�~�hqd�!Y�lf�)lل_�D���f���,�T�V8��Nk��`5�:���[i]�jgԵ��p��Ir�ߚ����F��"�Pᴠ����.9?^�_�*��VG���+l�:x�į���\�m;�����&��>W����SX�F��O�H�Oی��Å<Ʉ�v�S'�0���oZi>��56���,���g�����HU�O������r��m?o��D��~|�4캪���JSPT�M����u�G��:�}�Bc�r��Z�bv�B�@����8�2�)����"ӿ��AV���.�[�p ���g@���b7��#u�lP�_�^�>��;��ή#\���!�\���P��Ǒ��x6:���*{xڙЯ��vҢ?ǣ;�7]����v��6�c��!s����$+��͐�5�ExM�����˒56�6B6$�؃��g��vj�;`l���K��M�����YZߒ�����AϋH����XR��T��2�Q�[�9�b_�V���>H1���/��XR�N^�P,����_�e��ͤ7$��ٌm�sf3Ya���A�M���9ΑoI�])����+��{����B�A!|���؈��|\��%�f�~�jSn��L�wj^��%E�t
N\�;��m�L|Ě��G>����+'b�F)���Np�~+�.>���
}��R�����Fx�}PgG:�к�9rI�4��%�@����q��ڲ��Bf�������Xp�BT��d�j���������\�;�:��+]÷�#��]�L�ƃ����9z4n���1��䷅�ß���lp�'Ц�TA�J��K�`��O]G�ù=tA�M
bW=�B��8���	���m*a{��hK���2�ϴfk�f.���V!'�X:�9��d�$.d�x��ź�st�}�PR �������0IYyʖ0N�}��U��"e�ɀ�N�;�A�h��L�>3o�\֥t�����b/{�|(v+[lA�����tatQ���� (�Z�Ve>O|\�ϑӌ�c�GGECc)s���c�@l��٬�F]@3�`hF`q��X�֡�'���^��5J�ʇx䶕�8{�v��P���,祌���]�	 WR�Bd�g���fowÒ�-�.���G�H8)��5e��B��=#�E*uhK���,ս&Y�� 8N�ƙ��sf��������cRb�	��H50�d_�쁱�E�}"�M|��$'vN������ ��D�K�I�r�3��a6PZh�sp��Ao�f�qv�c;En�P�?�R^WN�f�QxfJL�;|���;���5�#LE#�6���b��R
 ;Eu�-�,j�n'������zy��c�<��e ��K<G}=D�k<��,S,�X1�y�xP.�l��,��Ļ�Ӝ�JZ�r$I-�yQNl7O�O,�����Xښ���f�O���!�;�~b,�(�	B�s���]]��_?�^Un(C�ũǁX�#H����e2�rb�V��Խ�>YD��+q#	Hk+;�5O��F�}f)����/fOIl�?r�ha�N����U@u�a"����mkYR|`���@�	ѺHA�r}Y�{���A�oч+��'�\��,��lQ$�	՟/lF��6ˤ sb���v�	��@�!��<�?nUG�1�LaI�v�S���\���ҷu�a�A���p�}�G��3��[ئ�w{�E[a�u���9i{��"ɬt~���O�(��C�Ih������8Q{�+�h��~o���~23�WR:V�����6P�d��[٢�YK
�7�����]��Mi�~�/�C_"�y�}��P�`��}�16ĩ�eL|q����xd�Y��D<��î/���џHC�M��*�:;�$���v6��r�f
��g�~M�~�&��
��"f�pC�#�6[�?O��b����`q7�y��I���#7��$ۈ3�~M�p�Z�_#�`���L[�؂�QD � n�
De�G���~ȳm�4�����+#oMY��h���H�N��g���J@_�NFގ4>��up���,�v)>��ZP��7D9�>&Ӆ�k��!c�H��*���c�!�g��6��� @|�,;�4yajKIhZ�b�r��bC��Ԁ;WZ��py�U}��!oX�G�Y��μeú���u��(VW~CW���"60`��'(>7I�j�Rϧp�|�%ȉ����:P�2���Ԭ���g2��J}��j�;<QqR&\%��v4�aU?B}��ƌ�	-$��>C�0�R�^��nS*]�o�6�줃u:��g4&~���]��E�w��7������ёM`+��������{6S:;#���pԳ똳
����Q-)=`�~�������"j��E�9��V_H�Vڻ�{�S�P��89��m��I����Q��kc
\=���V�^Ԛ^��H��;�׼��#se��b�	)JR~N�3������O�]r���YŲ��_5O�.u.o-4ҲF��K�X��e�5O���7���ρ���drt$�0u.�|������,���ס��Nْ)"�Tϻ�J4�4^A ҵ�����\�p�i�x�Ȳɰ�$��wTˆ&9�רRɉ�Θ�>����I�4��jBf�u<�Y�Fh��8�3���/s�2�P8��5�V*t�O
�g��۲��b^�C��v�����z�`$ʟ�;i�&Jm��Amcu�{�=2�����+�w�)e��ʊ\��􉕏pW�s�H�u(!�:&�,�OK'�Pj/lⓙ&�cv ����/D��+ec�9�PɈ��
Dg�y��X��:B�¤��ߛ��ll�Ai_H{��Ϯ�G�u��<�,A������)5�B�N�b�Eˈw�Y۴0�l�{�����5���4���jBH�&=��]A�D�v�zs5�}�2��ʱ�+���w�dxA�J���]�:DdM��q�6�?�\n���o����0�����^f�ג�J���k�4�_F�	j@}'��.
�f�9��l>[ ����M��y�=ݕpF��D�Vۉւ�����#Z䀯�X8��)���W�K���; �u���,��\׫'u��[kh�x^�R�s�l�Y(i�	�k�,!�Vm3�R�������f��lZ�R�\.d'�e7��ȢW�ez��"O��{ /�_�̼:���0([5��O�.߆0;R�I������"�-5��D&sC[s��{�[B��v�_���@g�i�nc �E��2��2�|��Dh�Zl(۝t"r�9�͑�ޯi�q$���>گ��`	�˟�%3�M�B��n������x����WMDAo��pP
љժ��܁�71ؘ�Yԯ�9� VNj�����A.|����'M�WM���3     u��NU,�'�'^�X���AZ !x�����B�7](Ϡ��D��<\ȑ��U��l}9����u���`����~=�dp��V7
p���O��K�5f|!�f�]>�����UXFwa�����<�*uS���+_uU���feR��]8F�f�5��S׺�T�����oeQ�s����V� �Y�ԣbbZ���O2��E��� �\89�(ߞ2C3)6�=��4�e���	AɌ��rbGZ2�o7���������B?��2$ᰇ�6���'y^-4e	�Ws�-^�m
�4ƻ�vD�����������(��_aȢ3[��q{pj�,}�R�j뉨z� �Q�l������sO��6��%���4��w;��䀬���3U:c�t�+�f�p]�\��-�1��ny'K�մ	K%HM�[�'"��Y�藌XC�/x�,l��P�E2%ZH�	�{�u� 䟰=Z��N��2a)�	k&j!��W��'�v���g]@]�����~����M}�^��t��S���2�!R�ɥ&xQ97!%��� �}�����2�W��	�ech*�Ƙ�V�k��=�e��w���N�13�\�@P�'�]�1�ژδ�����v\�b�5�E4WG����7s3vB�q]i�`�fJ�Ô��
�IL8�K4���Ā[�==�b��c1��3{-�ɣu�Dm��TV�����u���Ug��m����ˡ�ؚʶYz�5|�L�����D3���dI��#�P;:�e��	Wz��8���m��e^�g�1!���z/u*M�;Z������.�H�<�_�O���I�7��e6C6��U�p-,Ɇ4��!���������<�0{�U��,��K�P&���[�J�<W�F�\��Ʒ[E����=WOy�����b��fS�
d�կ���-��g�� <��/��%i>�~Sp�09�mwX�U�W��K���b����P�k���~�&��gK��FL�_��>���\������o}�D'd�����4�PL;@;m�����dE�btp ��ex
A���*�f��a����h�+��2ícﺧ�<�y/��	�����?iHEA�	���yW�2�0^	_�eA��aq@-Hc0lu��u����V�2I�����P&!��q�<ár:�p]e���-��*_�U�h�\O�M���rNQ�C�p�[ެl�cT�<��Pn8�UNZ��Sf5A�|d�c�XY̪[��Hf�ą#��=	b�ה'e�za~��h�xb
�}�o6ћ���Q�v	�_�Rr9.;��7�J����I"��RÔa����x�1����P�|8U23$�ʔ���Q�p�� 
�0�=��:̤�e c�Q;��x�(����?U�?�,
�X�m1�2�Ï(�騮!�l�?�G�	�fo���"f�}V�A���Qc�����/̠�]�k=)�7��8,������#"`9��\`�+踁m+'��G㍮@`6@����'�t���q������wOL��\�A$\�@��֠veٙ�)�Aq�{�bHѯ>~@�}�|8���W{�{>�pA�-�pL?�	�0*�M�$�1&v� �
�KR��-[�AE�$�4>������`�$�1�5`[j6-"<�_�f���(?��͑b=	�req�'A�;�H��u6L-, vs=#[��i�K��kC?|�P���=�P�J_T�2�)ԉ�=�g�Shm��������+W���ø���j��:���#t��+���n�w+��;���b�i"� ���p���Ю#�S]����m �(x�|���c�
�@���{���4f��v��vbf���
���b��J0�U���^����.�: u�+&Ԣ�4�����7�����T�6}���\v�ؔ��枻�z\��Sq
Ӈ1`kS0OOf�u�9U�9�jk8�q��
�n�b���
�f���u��J�9��`\�T�F�,
���fwW�bh5��j�F�b�(v=��""�@��<>�;�Z�)���
:�߫��M��;<qٳ+@�Y�MyNq�h�a��CK۩ՠd�z��}���@�ڒ%^���^�G�	j��AC�� [[5^5󦳡t�3�4�{:�O���o��z�t�p�j�g��YA�M���Kٚ���#K��)\E��^`b���x;�b�B����P~EOC����_X�G�dA��[\w޴����w3��t�#n���g��m&W�H��H�M�L&#�>P�;�1��7w��:�����@��Q�\����Q�v���M��2�N^RC�۔�1S{<��J�����������?Y��|�:×��ζ��<Ү��R5��9�y��tW��_�4�	���{?Г���,���������c��1��l�s[M�a:0��<ĸ�}�~��������삋ȼ(���s$�m��(��I��qQ'/�����yҜ���>0'���[7`+����d	%ȃd��P�@��|�3�,A�a�ēxF�#^%VqpaebJ����f���:s>��y],e��}�9����3���G�Y�\�I�&�E%�f�ӧ iKv�r��}�p?"��u��(j��
�)Ȃ��`�s�`�Q�gW��*X�Ϗ�#F��L$�������T�jg'�f�j{O���˼��_n��N��Ï��?7@�i��v����lL~!_C��D���+0&�0'}��H[5�-/�+��:�9��Y���1�)��^� Ǩ&�Px�8��=ӿ��+;�	�j�iF����N�9<�+�i���S�"�P�G�q�����Rp��ϗ֬�q�l!��0��I��-R��.���|MM+>u��v�0-,ޙ	R�Q��3)q{�a�3�=8�^�j���g1�C[����3e��d�݃-���'���~ ��6���k���U�v�����ODG&e�����7;�})�����D�]�K��5t'���m���p_���6���^>CLLq��$������UBT�7��SDP�\g9'J��
�������(ȃ1�1�Ԅ-�.oO�>�(@��ߪ����)�5�kO��~*� ��SL�?���~|��@L�<7.y����7�hJG�<��|,�������0��2'�H�R�t8�o��m�%7�V�3
�韋��1[��=����t�EU����|���=?��b�f��L>����s�ucpE��q�n-A�qn(Q'�V��0�B\��Fwn�!��+�5��Ls~��y]�tv|��%:�"��7(=��ⶎ�|��k#[������;;�w)����L��8�?�����	��� ��rZ_~�$u{����l�k�tQM.P�G!��6��㣙���"���5�e�9	�+�Z�υ�����Ǌ��~����c����;�"[��@	�F1��a�=Nב][�o�����鯢+f��yiΙ?���N)p� �/Ϧ ��4`�e�:�:�[�d�L��	X�{",�=,��D�~�ƹ��un�;�kf��>@u𠞠p2NKb���XiI;���QAl��7ۆk���1���;���^&��ް4i���~����'��D��]Q!��>����9��6X����0F�q�j
�����F�����!*�p
��/&�9Cl���v�b+{�������L'����D핳0M4��%�����AE�tG�N�i������A�����+���o���Ϲ;�=�%n�C��a\8�1��Y�mI���W��uݦ[BY�V��T��ii����j�!2s����'���ހ4̝	�P���r!Z�!V\'�R:���e�{'wq��U���Ie��W(5����c�N��LR�H�J��Oh6���VizO�e�_�ԓ����o���|�ۙ��u_�� ��ٿ#��D����������v[یu�[��6A>1�#hkQ&���'g����<"=D���w>ȩ���;����N^Q�н�g*܃L;��sX�~ �  �\5�H�'�y`wpݓnM������������̕Ŷ�'�|CXD�����<���]��Wm��������� �n_t�*�#p4z��ߏ3��w�ak�����"_�F���l��o�:{�}���<�8�9*G���G5�$�<�t�`;7����yu�d���h�>x�$�Cڞ��a���{ F=KbJ87Ц$�#�x�p<wA�Ql<F�y@�]�!M��@�ez�27w�a����󖐒�M����1���8����"�[���!*�늚�� s�n[	�����)�g��%1�0��"�����6�u�/�­.is?��)��h�]��[�!��|��|❹��A�"2
�������3;.Ͳ��y�p��k��~|�@�������\�e����OOY�j�h�$�������	/���Tc$�`4r]:m�Pš�!)y�vt��i�@�ϗ�	<��g�f��g���]װ��. ���L��3�`!���-ϣ�č9yk&�+�;&.����C�iB�WS��>�
y4�=�CG�w=��ݱ�4�� ��yV˰��A��|?��e%�fஹ{^�!�MFw^iJgȷ�+�r���4p���k�Ճ�I����N��P�[�,$;Nt W+o�3�.��� ��9SQm��{S�� #�1]�w᰻桿�i��C^e4o�S��!�+/����X���1I�z1�%��F|�2���TJݍg��7��D��&�R��+�L8MN��n%;�gya��ʩWG�n�TD��3�!�Fڦ�u�Y;'��eh�|���^Πp���R�Gj�m\�X1t���Y��sH<w��-�n���h0�<�N��e�tD_�3�i�-F�h]p�EV;��� ؾu�Y�j���kR��2�]	��TD�+��k��#��J�Z�7nf�9�87&<�K#.\E˗�U��q|H]%r��(��ʁyp.�k�m3���A\c�X�����1Ÿ�mj���@����D���xR��7���v��y��ĺ����x�h*}��ڃbn�{����UFs����̘��<��l�eNL0`3�noMu�p���f�l-X����2#������F�7�����-l�1�-׀�f�	�r������x�g͛��C���7�r�6��EƋf�2��`
�rX5!�O=����Z�\�b��Ew�����1Z}!���'����Zì+��$n�I��׭�`D�L�>�M�DF���	{�#8%��f�"���e�v�j �o۩L5��@%j<_��r��ԑ����U�ܹ@�l�P����%w�1��Fo����3���r����۔R���A֪ݼ�b�袯�t�,~'�� �Uk�)~z(&=Yz&�y)���oq�PTDP������E4���&�W�qu|oL$2ʿ��1����si��ft�=|�HwK���Q���eO���z�3��gi��+��.u���]D.�{�]_)���=�k�>
�_�a�����m�Ř�[?���Y�6���TS>I�S� aPFV��@�N�͙�߽���`����Ƃ��>��9��SQ��ł*I�3�e7��l*}'�g���s�������50�z��s>lQ�p65e�/ ̾ ��b]��B̐(|�ʹ�5uu'� G��Z�yZ9x�l��1g��4�r�t8��`�ebfӡ�y�N��2\:��@�y�`����x�pal��� k�
�?�z��t#�����׀?��s�Âv7[%Ĝ1�Z��[X�XIi��cG���~Δf;���x{Rځ��3���R|u�wl1�4J�0CV�����s����0����h���Tw��y�i�(5�:�(��D4��dS�\�0kd��'|�����j;�Y'�6���]KB�ǣ�����2��Ϟ���h�POa����jl4��-}������$�j�T��x'�X��E�0uO�x��C�c�E�G��r<81�vg1 �s��aZ�#]�T�`�x6� �=�؂���Y����6�~��f����%�p0�s�\�m{p������l�9������Տ��o�;`�e㽕O���C*��׀5�@��BE�u�^[7����!�H��p\}���y�����3�H_�S�^4��v`Bb��,�
�Ƈ{��y8)���Ȏ���NL��<Pp(��,p���}]��d�li      �      x���K��rE�/G�	\C��$��0����a��ʓ�ϊ��U�<)�������?�������_����<���Ci��O;��8�����k����{	��w�����?�x�������[���o�?�s�a�}�M��+�����q�q��7���?�������q����O��9�ĸ�;�8��'�wa�������z�������Z��ux?�׎u`;>/���4��{�0�a`��͡yF�'=��XB2m�̝�[B3M��W]�w\�A4;�x�������_�j���>���ց�M��j^Ɵ���@7���[�e �Ӯ�1�F|��gΖ�PN��_�;�{9���H����Fr�ɀr�}K����~W�#�}�X��m��rD�Z�b�|T(Gl<��utHN���f�GCr���P��w��e#�0
�#���U��r���HW�N�����@9rOA����	[*���m&�m:��Q(G��X=�M�ۊ���|��\��wr,�B9�m�f�z���e9�Q��Kُ��C����?����ј���Ɂr��N�n�*Γ�B9z}��Xk����=�#Y I[�eP�c9Z>��/�r�ɕ��m:V�1��sd�7��X�p�y��'��ʱ��X���k�;B9�O�X����`P�-�Uq�.�U�r�6��G]�?�r�/l��<����=T�4�*���C9��,�r�˱<�C9ަV���á����rx8����:�i��9�/B9nC���̎�ˡ�a&�h�^�C9���+K�g�r����is$� �w\��P�_�5I��碂 ���8���YPN,י���Z��r�y����"������~�q���ܯy��
�DWN�L��K�
('�͹��Vʉ�N��sZ-('��ד�󹋬���5��(G����
('�a
�l���b�O(��^N�Mg�<B9gGZ�����9e>jY��xB9�]J��{�.Z=�����Z��w�rN�3X~��F>��s�9R�N�pB9��������@(��I���iZ��	����uͦ�#��r�c<��m�ցP���ԗYl�ʹ��J�~��W׳�r.Z=��|Ò_P���[�"�u9.(���I ?"_���\]9��\�������[��/pA9W�9����B9W��{>��uC9�2�ٮ�/��r�P�=mNa�G���S9GqW�!�Pέ����iWo(綱�؜��rn������
��r�yZe9x�r�rޘ��ON�s_cw�k�[��pC9�=��js�؎U:m��E��ͷ�ad�: M�@�[���2UW6H#�:#uX���lr=�ai�i�ܓƵ��>������
+~30rP�ͷW�x�y�E����#�����*o���7Fv�\�r�l�ɭ-4��栆��[������Hhh �ra���\WD�����|�~�g+4Rn��=��̟� �L�3p��m�-44���|a����P랏nH����5/:Ś\in���}�+}?�D``��4s-[�Sj �m��s3�A� ��Z��ƶtaxFBC�ء� �i����?�8����@��|��m\`��/�����)m�r���U�
_�0��%ۡ�����{A-�fK��Հ��N�S��� �ܴ�B�x%A�27�v�x�x�3R�����BbАv'�X�#�g$4�>׳`FD@s�ٲ��0��@�����?Ϸug5�j��,Y��6XsYϖ"����l���|�U����:3���~�H%4���?'^�7�=#�!둊��u=����o�s�nA����QG��-yo@�ͺ�<��``�m0�ks���� ��M;$��:� �d��,�u=���/Ov��Lyܹ�r��K�ۂ�3��:xf`kڡu�<7�gY�<~��>��6��Q��3rF��������=Ӫ@C~�U�-���y���n?>5f�g��w�[ �ӶJ�]y������Mh���:�~�j��s�B�F�e?�E�C�&d��~�n�B�W R6Q�n�;�}jp�3��6��3]�gū�n�����H+��Ωnٜ+�-Xt,�U/�k�����i��U�4:g�$�Pv�nG���}��	�SC۸º?��H�����i����w͡+�	AC���y�D�I���e%ԣ��j���Z���.RP�֩t%K�=���K��⃁K�k���ߴC ����~SJ*�t�|j���g�t��v�������M���Y�mR�tp��W>�Xh��q�3��<��-��g�t�����'��	@�����H����=�T���C �vO�x��J�0����Ci%�'{R��펡��W��2P�v�cG�U��~FBCw����ч�a=��{� �[�3��ZV�Zb\ܟN-G�н���O-��r�����"���T��1��}���Y�����ߖ]���g�cd��[�������1;�����22��&���j�Z�k(a�,ˑ7F��M�Q��U���M�S�W�Z>�Z�l��y�#����K�����3j=RVn�?���	�y���UI҅����cssEZ(8�N]�If��Hhhp��0�|�pji�,��I���.��Һ?�y֝N-�h�xR7�8����6Ҷ�
8�N�5:�	8�N-�޶tyFBC�S3�?l�&8��,�r�[�ퟑА,v�$�^T8��9֮&���FBC2S�j��hM��E&cl�\I�Zt�@��$N-:c%�(�xFBC���M�*qj�]"��\	� �Z:������g$448uI��L~�Z4�<V~ˤo��>u�R~��S��{Y����u�S��XGIQOY�N-ֽ��x��Z�[βr")g�Zl)�(3��pj�/�4+�?��e$F�&{C��BC�S����y$4d����z�S��SiE��pj��V_XM��>#�!��f���h��S��w���UC���95��"a����e�Mt:�S��X�m�FBCnc6깢�-8�tN]�?��ՀS�w;��uxzOh�g�bI�ˊ�����f6��R��2�K�]�M/����^W���N-1�kt/�ՀSK̘k�)�)�Բp�Zz����b���j�p�SK̪���	ŌuԊ���Zz��{U6$%l������	�S˒1]g��i��ep�n9F'��rvh�sZMpj9gqXaR���Hh���,��H��S��}�r:Xٟ��r�T�&���Z���y�2��ZΙ�Q����Z�>7��N-�=�VO���	N-ײv%�~�Z�Y�q��e�L��嚱)��YN-W������Z���R�P�^N-W�C���T8�\�1y��b����.Y�Mx���k�����I8�\���\�N-��ww{(�Z�~�_��R��{�1�$cfz
8��L�R����	�����k�S�=k�jfs�M����d��XQ8���X�Vn���pj���nP<8����Q��>Ԯ��ZW.S��H��S�1saKnW�)����Ė�~���9���|۾�D�Z�Y�Q��/�s�S�1+V�-�����Y�Zs��M�Z;��9�>#/�����	�4�7Fv��Ͻl	N�K{�Vxb�Hhhp�g�rY��Sk����Ӆ�3���2�e
N��S��^S��	�YӑN^��X������V"�
N��+Px�l����KNa��{FBCm�B,��ń
N�ҽ�RiWjP�ZG>ul��z�S�̺�����Ze�C�63b���:�Kw�R����:8u��9��	�|��53�|FBC��[oW
N�r�U�����А���U3�R���S��U���>�������Y
N��iG������Ԫ���$n��Ԫ��Ke���S��۱��g���S��܏ڹd�	�|��Yj�󌄆t��%{-w�V�v�t-�Rpj�i���h����f.l��1��	Y�u�j�Ouƪ>pj�~�?6w{��Rpj��Ԭ��+�Hh�f5�d�8�f�V[��e���*8��9�&���0�Z��d�u����l�A+��&8�vN]�)��Wpj���ݮ�Һ*���2��& kN�� �  S�N$�(8�����ϭ�	����˿]5N�#�z�&-E��ZG>ui�#9z��Ժr��Jv�ZG>u�ƪ>pj�ɇj�<�+8�.������ZcɅ-7���
�ZC����N�as_�|�u=��5zN~�&sE�Yc gZhhpj�9�)�A��5f�G�I-��Zc�c���un��up���ȹ<
N��b�vy5�ӂS�9�e�KOkT8��:l�����-8��6ީ��䍃S��1�d#B}��z���5v�<��sֹV���o�Hh�q�]�>4N�#�z�������z������Upj�����,��Ω�xO$pj�}>��=�|Ohh�Sۆ'$N�׬ڵ��	�ZG>u�j��'4t-�A�l<?��u�ԥ�)��Z{���u�=���S�}�߬u ��Qpj���J˕L
N����V7;�(8��K�l�?�Z�~���"��ֻ�u�.%�'4ԛ~T�`�O���^�e���(��S�={6��/����:8ul���8�-;jg�׈��S�ȧ��݁�e�����JCΒ�a��v�Z��}��ONmG��w�c[�!��y��9��0pj;�z����}NmK>u��ƪ�����TH�g=#o����%��;H�S[[�b��l�f�Զ��h��;f��־ŧNsNmm�Z3��Nmm��K�k�*2pjk3�Q�^G�[h�->�&;]6��������#��8��v�%#��=8��ڬ�s�����M�;U��[pj�٣s�W`�'NmK>um���BC���ժ�T�d��&3^�
�i\Opj뜺���~2�Hhhp���|��	�s�F�u8�ɬ��} me��M�Y��46�3pj���ʝ7e�8�钃�7-���t�(V���Nm:����S�/3pjӞ��Q|����t���S�T���Mg�t�2`�!�����m��3��=�M���{3pj�ŧ.�/�lpj�9�R"�}Nm�W|�Y�Nm�c�-皳g$4d:vY�\����l�1־�w8�N]�K?�	�'4����_T`}��S��ԛs%����l�(����F���f}Y����6_����8�y�ۗZiM�X�Hhhɧ���q$�6ﹰ�7��5���m��(T]Rs�g$4�>s��Nm��t�[+��6�u��g_�6���j�����6�_f�Ԏ���-����{�Hh(��n2u��'8���K��0��-&c,y5)����-�j59�8�E�u��x-WY8�-��w7WXpj��,�E���ȧ�ǖq���%���7a�����\�	�>�k����m�S����Ȍ�S�����%I�&8�N��TI_����������Tpj����c�6?��Ω���o58��3���������~��*|�6��F/j�DI�7Nm�u�#���3��YV��T�D8�]�Z�+��H��v�{Y!�-������PeƉa�S��C	5˝�ANmWυ-�	V>�Nm=�z�Y���BCW��Y�fb�Nm�_�۳����m�Ի��@���68��b+�2pj��gJ|%����6�~�;��f��[pj뜚Y�;E>#��ћ�ج'����Fߏ]4Ff����S�Z�3��������q޸�*��}���~a��8�������0�ڏ��X�K������?�O^����G� `>��S��ԥG��[��S���W�ٚ{;8�����(	�����>�M/v�spj��d�kf�N��=���S�����ަ�j,�t���}ɧ��	��98��|�ݷ5������ԅfY�J;8��Y_V�x�Drpjo>�ՆS���S{�9�E��j����αՏg'*����J���4�fc���������k������]z�Ǯ��q�v�=�j�f688�ˌ���'v68�K�C��Z�;8�Nݲ��\���.��p��ҷ!��{�V��j�88���C5�۩!pj���Q>}�?�N�S�ȩ�/8>#���O]�:$��N�*S	���:C�Ԯ:�v��>|���ԕ���g$4�SC�?o�N��?���帠�S�NƸ�����t���/	�4C��ҟ�|�'�T�v[��]FΪpj_�S��#�W��{ߏ�5�#�.upj~c䁑АM�z�=#�!��C�
|���?���&c��p���v�v��)L���џzG�ywppj}?�0�ܯ���}p�ҷ������S��/j��"�S��2�k������]�m˵^N��5d����l�v��?��ҷ���c�d�&��pj��,��}�!hȧ�j��ŝN��}�c����8�Ǵs�3�����m�S��\��c��*^j����=�������ڗ�$�:�t�S��O]s~Z0pj�z�'0����=&c��u����X4��m�@C�S��E-�y����g�� ����Ω��Ҍ]98��K���6�=���\�f|�߄�F�RsZ}pj��K�}�9ߑ����S��xpj���Y�5}{�&4��[�g�����}�Sf�����S��쨿���S�5c��&&N�W�s-��R��3�f}��Ù��S�5c5���N����9+�	]3�V�03�����*^��|j��k�1��3����~u;T�KK\�������e)s����^z6lr
1���>�~�fU�y����s�����>#��ޟz[G�.�N������p��S�����O�]N���7�@C�?u�#�c��S�=������~|�S�PZ�xn�;]�S�1ϲ�MX-u�S�ȧ.Q̢� ��%��x�)���q�z������1�~��.��qL>TO^vAp�8~e��~%���=v_`��o���n7_LXϲ ������ Z��8u��������d�����{FBC�S���#{*����S�6>���:4�z���tZ�Mh����}y>��~z�:�s-����:zߏZ�����������&���!��m��`��S��>�5���� ������K�GN��ԻSpU8u��ԑc �D
p��=�BDctN�Sǆ��'v�S�,�|)3�l8uȒ���2�HhH��լ.䪾�:Fߏ3�Ԗ�%8u��c�3�o8u�ҳaS	N��Ǯ�8U8u��P�R/�p�}?Jg�=U�:t�\Kns�&p�S�N;T������ޟ�֒hfRN:}ꚽ�̣ ���X{�>#�![�\˪��/��Ö�1%���^�SG�����IY#NKߏ��Ha�:l�J���]8uآ��7ι�����մ�=�!���S9��	�d�5�H[�S��O}V����Hhh����nS]G�S�/�C%+���BC�S�>����:܆F+"�p�蜺Z˱� ��9h�-s�:���K6b��{FBC>�1ʓ������^����>-8uĲ/v�׹��Ωk����8uN��y���8uĬ���&�|8u��/\�Y]N1�JFN�Qp��Q<k�{b�N�c����󌄆>��S��8��?��#�܏�ׄ�*��qο�������:Fߏ��N�	��F���yN�S?�RG�g$4t��C5�I"��q��?$9'"��c��.�������q�~�%�Uz8u����.��{�S�9}�rfg%�S���ʷ�g$44�~�z�%?�:.���
64N׬먧 )l�S�5�e5��'8u\ӧ�u_�oBC�S�XG������Y���
8u\��P�l`Vt�S�ȧ.�B)�*
p긷O6o����������N�RT��M��:�Y_Vc��c��{��}"�N�����C�S�=�_V��2��	N]�NJ���3��*_!���:c�/u�+'8��r��I�a�ǿ�^����      �      x������ � �     