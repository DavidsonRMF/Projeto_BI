
CREATE TABLE public.dim_data (
                sk_data INTEGER NOT NULL,
                nk_data DATE NOT NULL,
                dia INTEGER NOT NULL,
                mes INTEGER NOT NULL,
                ano INTEGER NOT NULL,
                CONSTRAINT sk_data PRIMARY KEY (sk_data)
);


CREATE TABLE public.dim_cliente (
                sk_cliente INTEGER NOT NULL,
                nk_cliente INTEGER NOT NULL,
                nm_cliente VARCHAR(50) NOT NULL,
                sexo VARCHAR(10) NOT NULL,
                dt_nascimento DATE NOT NULL,
                bairro VARCHAR(50) NOT NULL,
                CONSTRAINT sk_cliente PRIMARY KEY (sk_cliente)
);


CREATE TABLE public.dim_calcados (
                sk_calcados INTEGER NOT NULL,
                nk_calcados INTEGER NOT NULL,
                tamanho INTEGER NOT NULL,
                tipo VARCHAR(50) NOT NULL,
                cor VARCHAR(40) NOT NULL,
                preco NUMERIC(10,2) NOT NULL,
                CONSTRAINT sk_calcados PRIMARY KEY (sk_calcados)
);


CREATE TABLE public.dim_avaliacao (
                sk_avaliacao INTEGER NOT NULL,
                nk_avaliacao INTEGER NOT NULL,
                nota INTEGER NOT NULL,
                classificacao VARCHAR(10) NOT NULL,
                CONSTRAINT sk_avaliacao PRIMARY KEY (sk_avaliacao)
);


CREATE TABLE public.ft_compra (
                sk_calcados INTEGER NOT NULL,
                sk_cliente INTEGER NOT NULL,
                sk_avaliacao INTEGER NOT NULL,
                sk_data INTEGER NOT NULL,
                dd_codcompra INTEGER NOT NULL,
                dd_hora_compra TIME NOT NULL,
                md_qtd INTEGER NOT NULL,
                md_desconto INTEGER NOT NULL,
                md_valor_total REAL NOT NULL
);


ALTER TABLE public.ft_compra ADD CONSTRAINT dim_data_ft_compra_fk
FOREIGN KEY (sk_data)
REFERENCES public.dim_data (sk_data)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ft_compra ADD CONSTRAINT dim_cliente_ft_compra_fk
FOREIGN KEY (sk_cliente)
REFERENCES public.dim_cliente (sk_cliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ft_compra ADD CONSTRAINT dim_calcados_ft_compra_fk
FOREIGN KEY (sk_calcados)
REFERENCES public.dim_calcados (sk_calcados)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ft_compra ADD CONSTRAINT dim_avaliacao_ft_compra_fk
FOREIGN KEY (sk_avaliacao)
REFERENCES public.dim_avaliacao (sk_avaliacao)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;