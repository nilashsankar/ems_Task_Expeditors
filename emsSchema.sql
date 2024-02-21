PGDMP
     8                    |            ems    11.4    11.4 @    a           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            b           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            c           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            d           1262    16867    ems    DATABASE     �   CREATE DATABASE ems WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE ems;
             postgres    false            �            1259    16950 	   candidate    TABLE       CREATE TABLE public.candidate (
    id integer NOT NULL,
    name character varying NOT NULL,
    email character varying NOT NULL,
    interviewer_id integer NOT NULL,
    status_id integer NOT NULL,
    scheduled_at timestamp without time zone NOT NULL
);
    DROP TABLE public.candidate;
       public         postgres    false            �            1259    16990    expense_detail    TABLE     �  CREATE TABLE public.expense_detail (
    id integer NOT NULL,
    user_id integer NOT NULL,
    type_id integer NOT NULL,
    status_id integer NOT NULL,
    spent_at timestamp without time zone NOT NULL,
    amount double precision,
    description character varying NOT NULL,
    accounted_at timestamp without time zone NOT NULL,
    accounted_by integer,
    created_at timestamp without time zone NOT NULL
);
 "   DROP TABLE public.expense_detail;
       public         postgres    false            �            1259    16988    expense_detail_id_seq    SEQUENCE     �   CREATE SEQUENCE public.expense_detail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.expense_detail_id_seq;
       public       postgres    false    208            e           0    0    expense_detail_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.expense_detail_id_seq OWNED BY public.expense_detail.id;
            public       postgres    false    207            �            1259    16978    expense_status    TABLE     g   CREATE TABLE public.expense_status (
    id integer NOT NULL,
    status character varying NOT NULL
);
 "   DROP TABLE public.expense_status;
       public         postgres    false            �            1259    16968    expense_type    TABLE     c   CREATE TABLE public.expense_type (
    id integer NOT NULL,
    type character varying NOT NULL
);
     DROP TABLE public.expense_type;
       public         postgres    false            �            1259    16940 
   hiring_status    TABLE     f   CREATE TABLE public.hiring_status (
    id integer NOT NULL,
    status character varying NOT NULL
);
 !   DROP TABLE public.hiring_status;
       public         postgres    false            �            1259    16868    role    TABLE     [   CREATE TABLE public.role (
    id integer NOT NULL,
    name character varying NOT NULL
);
    DROP TABLE public.role;
       public         postgres    false            �            1259    16898    task    TABLE     �   CREATE TABLE public.task (
    id integer NOT NULL,
    name character varying NOT NULL,
    description character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    created_by integer NOT NULL
);
    DROP TABLE public.task;
       public         postgres    false            �            1259    16914    task_allocation    TABLE       CREATE TABLE public.task_allocation (
    id integer NOT NULL,
    task_id integer NOT NULL,
    developer_id integer NOT NULL,
    assigned_by integer NOT NULL,
    assigned_at timestamp without time zone NOT NULL,
    status character varying NOT NULL
);
 #   DROP TABLE public.task_allocation;
       public         postgres    false            �            1259    16912    task_allocation_id_seq    SEQUENCE     �   CREATE SEQUENCE public.task_allocation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.task_allocation_id_seq;
       public       postgres    false    202            f           0    0    task_allocation_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.task_allocation_id_seq OWNED BY public.task_allocation.id;
            public       postgres    false    201            �            1259    16896    task_id_seq    SEQUENCE     �   CREATE SEQUENCE public.task_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.task_id_seq;
       public       postgres    false    200            g           0    0    task_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.task_id_seq OWNED BY public.task.id;
            public       postgres    false    199            �            1259    16880    user_detail    TABLE     �   CREATE TABLE public.user_detail (
    id integer NOT NULL,
    name character varying NOT NULL,
    email character varying NOT NULL,
    role_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL
);
    DROP TABLE public.user_detail;
       public         postgres    false            �            1259    16878    user_detail_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_detail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.user_detail_id_seq;
       public       postgres    false    198            h           0    0    user_detail_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.user_detail_id_seq OWNED BY public.user_detail.id;
            public       postgres    false    197            �
           2604    16993    expense_detail id    DEFAULT     v   ALTER TABLE ONLY public.expense_detail ALTER COLUMN id SET DEFAULT nextval('public.expense_detail_id_seq'::regclass);
 @   ALTER TABLE public.expense_detail ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    207    208    208            �
           2604    16901    task id    DEFAULT     b   ALTER TABLE ONLY public.task ALTER COLUMN id SET DEFAULT nextval('public.task_id_seq'::regclass);
 6   ALTER TABLE public.task ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    200    199    200            �
           2604    16917    task_allocation id    DEFAULT     x   ALTER TABLE ONLY public.task_allocation ALTER COLUMN id SET DEFAULT nextval('public.task_allocation_id_seq'::regclass);
 A   ALTER TABLE public.task_allocation ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    201    202    202            �
           2604    16883    user_detail id    DEFAULT     p   ALTER TABLE ONLY public.user_detail ALTER COLUMN id SET DEFAULT nextval('public.user_detail_id_seq'::regclass);
 =   ALTER TABLE public.user_detail ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    198    197    198            Z          0    16950 	   candidate 
   TABLE DATA               ]   COPY public.candidate (id, name, email, interviewer_id, status_id, scheduled_at) FROM stdin;
    public       postgres    false    204   �L       ^          0    16990    expense_detail 
   TABLE DATA               �   COPY public.expense_detail (id, user_id, type_id, status_id, spent_at, amount, description, accounted_at, accounted_by, created_at) FROM stdin;
    public       postgres    false    208   M       \          0    16978    expense_status 
   TABLE DATA               4   COPY public.expense_status (id, status) FROM stdin;
    public       postgres    false    206    M       [          0    16968    expense_type 
   TABLE DATA               0   COPY public.expense_type (id, type) FROM stdin;
    public       postgres    false    205   `M       Y          0    16940 
   hiring_status 
   TABLE DATA               3   COPY public.hiring_status (id, status) FROM stdin;
    public       postgres    false    203   �M       R          0    16868    role 
   TABLE DATA               (   COPY public.role (id, name) FROM stdin;
    public       postgres    false    196   �M       V          0    16898    task 
   TABLE DATA               M   COPY public.task (id, name, description, created_at, created_by) FROM stdin;
    public       postgres    false    200   >N       X          0    16914    task_allocation 
   TABLE DATA               f   COPY public.task_allocation (id, task_id, developer_id, assigned_by, assigned_at, status) FROM stdin;
    public       postgres    false    202   �N       T          0    16880    user_detail 
   TABLE DATA               K   COPY public.user_detail (id, name, email, role_id, created_at) FROM stdin;
    public       postgres    false    198   O       i           0    0    expense_detail_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.expense_detail_id_seq', 1, false);
            public       postgres    false    207            j           0    0    task_allocation_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.task_allocation_id_seq', 3, true);
            public       postgres    false    201            k           0    0    task_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.task_id_seq', 4, true);
            public       postgres    false    199            l           0    0    user_detail_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.user_detail_id_seq', 6, true);
            public       postgres    false    197            �
           2606    16957    candidate candidate_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.candidate
    ADD CONSTRAINT candidate_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.candidate DROP CONSTRAINT candidate_pkey;
       public         postgres    false    204            �
           2606    16998 "   expense_detail expense_detail_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.expense_detail
    ADD CONSTRAINT expense_detail_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.expense_detail DROP CONSTRAINT expense_detail_pkey;
       public         postgres    false    208            �
           2606    16985 "   expense_status expense_status_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.expense_status
    ADD CONSTRAINT expense_status_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.expense_status DROP CONSTRAINT expense_status_pkey;
       public         postgres    false    206            �
           2606    16987 (   expense_status expense_status_status_key 
   CONSTRAINT     e   ALTER TABLE ONLY public.expense_status
    ADD CONSTRAINT expense_status_status_key UNIQUE (status);
 R   ALTER TABLE ONLY public.expense_status DROP CONSTRAINT expense_status_status_key;
       public         postgres    false    206            �
           2606    16975    expense_type expense_type_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.expense_type
    ADD CONSTRAINT expense_type_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.expense_type DROP CONSTRAINT expense_type_pkey;
       public         postgres    false    205            �
           2606    16977 "   expense_type expense_type_type_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.expense_type
    ADD CONSTRAINT expense_type_type_key UNIQUE (type);
 L   ALTER TABLE ONLY public.expense_type DROP CONSTRAINT expense_type_type_key;
       public         postgres    false    205            �
           2606    16947     hiring_status hiring_status_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.hiring_status
    ADD CONSTRAINT hiring_status_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.hiring_status DROP CONSTRAINT hiring_status_pkey;
       public         postgres    false    203            �
           2606    16949 &   hiring_status hiring_status_status_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.hiring_status
    ADD CONSTRAINT hiring_status_status_key UNIQUE (status);
 P   ALTER TABLE ONLY public.hiring_status DROP CONSTRAINT hiring_status_status_key;
       public         postgres    false    203            �
           2606    16877    role role_name_key 
   CONSTRAINT     M   ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key UNIQUE (name);
 <   ALTER TABLE ONLY public.role DROP CONSTRAINT role_name_key;
       public         postgres    false    196            �
           2606    16875    role role_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.role DROP CONSTRAINT role_pkey;
       public         postgres    false    196            �
           2606    16922 $   task_allocation task_allocation_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.task_allocation
    ADD CONSTRAINT task_allocation_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.task_allocation DROP CONSTRAINT task_allocation_pkey;
       public         postgres    false    202            �
           2606    16924 8   task_allocation task_allocation_task_id_developer_id_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.task_allocation
    ADD CONSTRAINT task_allocation_task_id_developer_id_key UNIQUE (task_id, developer_id);
 b   ALTER TABLE ONLY public.task_allocation DROP CONSTRAINT task_allocation_task_id_developer_id_key;
       public         postgres    false    202    202            �
           2606    16906    task task_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.task
    ADD CONSTRAINT task_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.task DROP CONSTRAINT task_pkey;
       public         postgres    false    200            �
           2606    16890 !   user_detail user_detail_email_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.user_detail
    ADD CONSTRAINT user_detail_email_key UNIQUE (email);
 K   ALTER TABLE ONLY public.user_detail DROP CONSTRAINT user_detail_email_key;
       public         postgres    false    198            �
           2606    16888    user_detail user_detail_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.user_detail
    ADD CONSTRAINT user_detail_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.user_detail DROP CONSTRAINT user_detail_pkey;
       public         postgres    false    198            �
           2606    16958 %   candidate fk_candidate_interviewer_id 
   FK CONSTRAINT     �   ALTER TABLE ONLY public.candidate
    ADD CONSTRAINT fk_candidate_interviewer_id FOREIGN KEY (interviewer_id) REFERENCES public.user_detail(id);
 O   ALTER TABLE ONLY public.candidate DROP CONSTRAINT fk_candidate_interviewer_id;
       public       postgres    false    2743    204    198            �
           2606    16963     candidate fk_candidate_status_id 
   FK CONSTRAINT     �   ALTER TABLE ONLY public.candidate
    ADD CONSTRAINT fk_candidate_status_id FOREIGN KEY (status_id) REFERENCES public.hiring_status(id);
 J   ALTER TABLE ONLY public.candidate DROP CONSTRAINT fk_candidate_status_id;
       public       postgres    false    203    2751    204            �
           2606    17014 -   expense_detail fk_expense_detail_accounted_by 
   FK CONSTRAINT     �   ALTER TABLE ONLY public.expense_detail
    ADD CONSTRAINT fk_expense_detail_accounted_by FOREIGN KEY (accounted_by) REFERENCES public.user_detail(id);
 W   ALTER TABLE ONLY public.expense_detail DROP CONSTRAINT fk_expense_detail_accounted_by;
       public       postgres    false    198    2743    208            �
           2606    17004 *   expense_detail fk_expense_detail_status_id 
   FK CONSTRAINT     �   ALTER TABLE ONLY public.expense_detail
    ADD CONSTRAINT fk_expense_detail_status_id FOREIGN KEY (status_id) REFERENCES public.expense_status(id);
 T   ALTER TABLE ONLY public.expense_detail DROP CONSTRAINT fk_expense_detail_status_id;
       public       postgres    false    206    2761    208            �
           2606    17009 (   expense_detail fk_expense_detail_type_id 
   FK CONSTRAINT     �   ALTER TABLE ONLY public.expense_detail
    ADD CONSTRAINT fk_expense_detail_type_id FOREIGN KEY (type_id) REFERENCES public.expense_type(id);
 R   ALTER TABLE ONLY public.expense_detail DROP CONSTRAINT fk_expense_detail_type_id;
       public       postgres    false    205    2757    208            �
           2606    16999 (   expense_detail fk_expense_detail_user_id 
   FK CONSTRAINT     �   ALTER TABLE ONLY public.expense_detail
    ADD CONSTRAINT fk_expense_detail_user_id FOREIGN KEY (user_id) REFERENCES public.user_detail(id);
 R   ALTER TABLE ONLY public.expense_detail DROP CONSTRAINT fk_expense_detail_user_id;
       public       postgres    false    2743    208    198            �
           2606    16935 .   task_allocation fk_task_allocation_assigned_by 
   FK CONSTRAINT     �   ALTER TABLE ONLY public.task_allocation
    ADD CONSTRAINT fk_task_allocation_assigned_by FOREIGN KEY (assigned_by) REFERENCES public.user_detail(id);
 X   ALTER TABLE ONLY public.task_allocation DROP CONSTRAINT fk_task_allocation_assigned_by;
       public       postgres    false    202    198    2743            �
           2606    16930 /   task_allocation fk_task_allocation_developer_id 
   FK CONSTRAINT     �   ALTER TABLE ONLY public.task_allocation
    ADD CONSTRAINT fk_task_allocation_developer_id FOREIGN KEY (developer_id) REFERENCES public.user_detail(id);
 Y   ALTER TABLE ONLY public.task_allocation DROP CONSTRAINT fk_task_allocation_developer_id;
       public       postgres    false    202    2743    198            �
           2606    16925 *   task_allocation fk_task_allocation_task_id 
   FK CONSTRAINT     �   ALTER TABLE ONLY public.task_allocation
    ADD CONSTRAINT fk_task_allocation_task_id FOREIGN KEY (task_id) REFERENCES public.task(id);
 T   ALTER TABLE ONLY public.task_allocation DROP CONSTRAINT fk_task_allocation_task_id;
       public       postgres    false    202    200    2745            �
           2606    16907    task fk_task_created_by 
   FK CONSTRAINT        ALTER TABLE ONLY public.task
    ADD CONSTRAINT fk_task_created_by FOREIGN KEY (created_by) REFERENCES public.user_detail(id);
 A   ALTER TABLE ONLY public.task DROP CONSTRAINT fk_task_created_by;
       public       postgres    false    198    2743    200            �
           2606    16891    user_detail fk_user_role_id 
   FK CONSTRAINT     y   ALTER TABLE ONLY public.user_detail
    ADD CONSTRAINT fk_user_role_id FOREIGN KEY (role_id) REFERENCES public.role(id);
 E   ALTER TABLE ONLY public.user_detail DROP CONSTRAINT fk_user_role_id;
       public       postgres    false    196    2739    198            Z   
   x������ � �      ^   
   x������ � �      \   0   x�3�tLNN-(IM�2�J�JM1�9s�K�J��RS2A"1z\\\ A
�      [   9   x�3�����LI�,�2�IM�U�)�K��2�)J,K��2�t*-��K-.����� uuW      Y   ?   x�3�O�,��K�2�N�IM.IM�2���S���I�2�J͂�r��)$�&��1z\\\ OD      R   6   x�3��M�KLO-�2�tI-K��/ ��9Sr3�L8���K�J�J�b���� d�      V   ]   x�3��
PH,(��LN,����,I-.Q(�HE4202�50�5�T04�25�22ѳ�064�4�2�PT����'`�����������Д=... ��'>      X   P   x�3�4�4b##]#]CKC3+SK+cs=Sc#s�̼��܂�ԒT.cN��V�VzF&f��朞�1z\\\ �]A      T   �   x�m�1
�0Eg��@�$[��)�bZ����t��B����=�c���O7�u���9C !�
I��HMȴ`�[]�n����ѕ`�M��I2FX����1�E���T��}�l<4�o��d�-fOEU
&����4r,�K��۠�Z�xD�	?     