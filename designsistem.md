# Carteira Palito — Design System v1.0

---

## 1. Identidade

**Nome do app:** Carteira Palito  
**Tema:** Dark Mode  
**Plataforma:** Mobile (iOS / Android)

---

## 2. Cores

### Backgrounds (camadas de profundidade)

| Token              | Hex       | Uso                            |
|--------------------|-----------|--------------------------------|
| `--bg-base`        | `#0A0B10` | Fundo raiz da tela             |
| `--bg-surface`     | `#12141C` | Superfície principal           |
| `--bg-card`        | `#1A1D28` | Cards e listas                 |
| `--bg-elevated`    | `#222535` | Elementos elevados / inputs    |
| `--bg-hover`       | `#2A2E3F` | Estado hover / pressed         |

### Accent (roxo/violeta)

| Token                | Hex                    | Uso                          |
|----------------------|------------------------|------------------------------|
| `--accent-primary`   | `#6B5FEF`              | Botão principal, tab ativo   |
| `--accent-secondary` | `#8B80F4`              | Hover do accent              |
| `--accent-light`     | `#A89FF8`              | Links, labels secundários    |
| `--accent-glow`      | `rgba(107,95,239,0.25)`| Sombra/glow do accent        |

### Semânticas

| Token     | Hex       | Uso                        |
|-----------|-----------|----------------------------|
| `--green` | `#1FBF7A` | Alta, lucro, sucesso       |
| `--red`   | `#E84040` | Queda, perda, erro         |
| `--amber` | `#F5A623` | Aviso, pendente            |

### Texto

| Token               | Hex       | Uso                        |
|---------------------|-----------|----------------------------|
| `--text-primary`    | `#F0EFFB` | Texto principal            |
| `--text-secondary`  | `#9896A8` | Texto de suporte           |
| `--text-muted`      | `#5C5A6A` | Labels, placeholders       |

### Bordas

| Token              | Valor                      | Uso              |
|--------------------|----------------------------|------------------|
| `--border-subtle`  | `rgba(255,255,255,0.06)`   | Separadores      |
| `--border-default` | `rgba(255,255,255,0.10)`   | Inputs, cards    |

---

## 3. Tipografia

### Famílias

| Família    | Uso                                  | Import                                                                 |
|------------|--------------------------------------|------------------------------------------------------------------------|
| **Syne**   | Display, headings, labels, botões    | `https://fonts.google.com/specimen/Syne`                              |
| **DM Sans**| Corpo, UI, captions                  | `https://fonts.google.com/specimen/DM+Sans`                           |

### Escala

| Nome          | Família  | Tamanho | Peso | Letter-spacing | Line-height | Uso                              |
|---------------|----------|---------|------|----------------|-------------|----------------------------------|
| Display       | Syne     | 32px    | 800  | -0.03em        | —           | Saldo total, títulos de tela     |
| Heading       | Syne     | 20px    | 700  | —              | —           | Títulos de seção                 |
| Label         | Syne     | 14px    | 600  | 0.02em         | —           | Nomes de moeda, botões           |
| Overline      | Syne     | 10px    | 700  | 0.18em         | —           | Section labels (uppercase)       |
| Body          | DM Sans  | 15px    | 400  | —              | 1.6         | Parágrafos, descrições           |
| Caption       | DM Sans  | 12px    | 400  | —              | —           | Tickers, metadados, timestamps   |

---

## 4. Espaçamento

Escala baseada em múltiplos de 4px.

| Token        | Valor | Uso principal                   |
|--------------|-------|---------------------------------|
| `--space-1`  | 4px   | Micro ajustes                   |
| `--space-2`  | 8px   | Gap interno entre elementos     |
| `--space-3`  | 12px  | Gap entre itens de lista        |
| `--space-4`  | 16px  | Padding interno de cards        |
| `--space-6`  | 24px  | Seções internas                 |
| `--space-8`  | 32px  | Entre seções                    |
| `--space-12` | 48px  | Espaçamento de layout           |

---

## 5. Border Radius

| Token  | Valor  | Uso                              |
|--------|--------|----------------------------------|
| `xs`   | 4px    | Badges pequenos                  |
| `sm`   | 8px    | Elementos compactos              |
| `md`   | 12px   | Inputs, tags                     |
| `lg`   | 16px   | Cards                            |
| `xl`   | 20px   | Cards grandes, wallet card       |
| `pill` | 100px  | Botões, tabs, badges pill        |

---

## 6. Componentes

### 6.1 Botões

| Variante    | Background              | Texto          | Borda                            | Uso                        |
|-------------|-------------------------|----------------|----------------------------------|----------------------------|
| Primary     | `--accent-primary`      | `#fff`         | —                                | Ação principal (Quick Funds)|
| Secondary   | `--bg-elevated`         | `--text-primary`| `1px solid --border-default`    | Ação secundária (Transfer)  |
| Ghost       | transparent             | `--accent-light`| `1px solid rgba(107,95,239,0.3)`| Ação terciária (Earn)       |
| Danger      | `rgba(232,64,64,0.15)`  | `--red`        | `1px solid rgba(232,64,64,0.3)` | Ação destrutiva             |

**Tamanhos:**

| Tamanho | Padding        | Font-size |
|---------|----------------|-----------|
| Small   | 6px 14px       | 11px      |
| Default | 10px 20px      | 13px      |
| Large   | 14px 28px      | 15px      |

**Tipografia dos botões:** Syne 600, letter-spacing 0.02em  
**Border-radius:** 100px (pill)

---

### 6.2 Tabs / Filtros

```
[ Favorites ]  hot  Gainers  Losers
```

- Container: `background: --bg-card`, padding 4px, border-radius pill, border `1px solid --border-subtle`
- Tab ativo: `background: --accent-primary`, cor `#fff`, box-shadow glow do accent
- Tab inativo: `color: --text-secondary`, hover → `--bg-elevated`
- Tipografia: Syne 600, 12px, letter-spacing 0.03em

---

### 6.3 Badges / Status

| Variante   | Background                  | Cor           | Uso                      |
|------------|-----------------------------|---------------|--------------------------|
| Up (alta)  | `rgba(31,191,122,0.12)`     | `--green`     | Variação positiva ▲      |
| Down (queda)| `rgba(232,64,64,0.12)`     | `--red`       | Variação negativa ▼      |
| Neutral    | `--bg-elevated`             | `--text-secondary`| Rede, filtros        |
| Accent     | `--accent-glow`             | `--accent-light`| Destaques, features    |
| Warning    | `rgba(245,166,35,0.12)`     | `--amber`     | Pendente, aviso          |
| Live       | `rgba(31,191,122,0.12)`     | `--green`     | Status ativo             |

Border-radius: 100px (pill)  
Tipografia: DM Sans 500, 11px

---

### 6.4 Inputs

- Background: `--bg-elevated`
- Borda padrão: `1px solid --border-default`
- Borda focus: `1px solid --accent-primary`
- Border-radius: 12px
- Padding: 10px 14px
- Tipografia: DM Sans 400, 14px
- Placeholder: `--text-muted`
- Label acima: Syne 600, 11px, uppercase, letter-spacing 0.05em, cor `--text-secondary`

---

### 6.5 Card de Saldo (Wallet Card)

```
Est. Total Value
$1,338.82

[ Quick Funds ]  [+]  [ Transfer ]
```

- Background: gradiente sutil de `--bg-card` → `--bg-elevated`
- Border: `1px solid --border-default`
- Border-radius: 20px
- Padding: 1.5rem
- Efeito decorativo: blob roxo desfocado no canto superior direito (`--accent-glow`, blur 40px)
- Label "Est. Total Value": DM Sans 400, 11px, `--text-muted`
- Valor: Syne 800, 32px, letter-spacing -0.02em, `--text-primary`

---

### 6.6 Lista de Ativos

Estrutura de cada linha:

```
[ Ícone ]   Nome do Ativo      Preço
            Ticker             Variação%
```

| Elemento     | Estilo                                              |
|--------------|-----------------------------------------------------|
| Ícone        | 40×40px, border-radius 50%, fundo colorido 15% opac|
| Nome         | Syne 600, 14px, `--text-primary`                   |
| Ticker       | DM Sans 400, 11px, `--text-muted`                  |
| Preço        | Syne 700, 14px, `--text-primary`                   |
| Variação +   | DM Sans 400, 11px, `--green`                       |
| Variação -   | DM Sans 400, 11px, `--red`                         |
| Separador    | `1px solid --border-subtle`                        |

---

### 6.7 Ícones de Navegação

```
[Ícone]   [Ícone]   [Ícone]   [Ícone]   [Ícone]
Mega Drop  Spot   Reward Hub   Earn      More
```

- Container do ícone: 48×48px, border-radius 14px, `--bg-card`, borda `1px solid --border-subtle`
- Label: DM Sans 400, 10px, `--text-muted`, centralizado
- Gap entre itens: 12px

---

## 7. Tokens CSS (variáveis prontas para uso)

```css
:root {
  /* Backgrounds */
  --bg-base:        #0A0B10;
  --bg-surface:     #12141C;
  --bg-card:        #1A1D28;
  --bg-elevated:    #222535;
  --bg-hover:       #2A2E3F;

  /* Accent */
  --accent-primary:   #6B5FEF;
  --accent-secondary: #8B80F4;
  --accent-light:     #A89FF8;
  --accent-glow:      rgba(107, 95, 239, 0.25);

  /* Semânticas */
  --green: #1FBF7A;
  --red:   #E84040;
  --amber: #F5A623;

  /* Texto */
  --text-primary:   #F0EFFB;
  --text-secondary: #9896A8;
  --text-muted:     #5C5A6A;

  /* Bordas */
  --border-subtle:  rgba(255, 255, 255, 0.06);
  --border-default: rgba(255, 255, 255, 0.10);

  /* Tipografia */
  --font-display: 'Syne', sans-serif;
  --font-body:    'DM Sans', sans-serif;

  /* Border Radius */
  --radius-xs:   4px;
  --radius-sm:   8px;
  --radius-md:   12px;
  --radius-lg:   16px;
  --radius-xl:   20px;
  --radius-pill: 100px;

  /* Espaçamento */
  --space-1:  4px;
  --space-2:  8px;
  --space-3:  12px;
  --space-4:  16px;
  --space-6:  24px;
  --space-8:  32px;
  --space-12: 48px;
}
```

---

## 8. Regras de uso

- **Fundo:** sempre usar a camada correta de background; nunca colocar card (`--bg-card`) diretamente sobre base (`--bg-base`) sem surface no meio.
- **Texto em fundo colorido:** usar sempre a versão mais escura da mesma família cromática, nunca preto puro.
- **Bordas:** `--border-subtle` para separadores internos; `--border-default` para elementos interativos (inputs, cards com ação).
- **Variação de preço:** sempre `--green` para positivo e `--red` para negativo, sem exceção.
- **Botão principal:** somente um por tela/modal.
- **Glow do accent:** usar com moderação — apenas no botão primário e no card de saldo.
- **Tipografia mista:** Syne para qualquer coisa que o usuário precisa identificar rapidamente (nomes, preços, ações); DM Sans para tudo que é suporte ou leitura contínua.