# 🍦 Plano de Upgrade: Carteira Palito (Frontend 2.0)

Este documento detalha o roadmap para a reconstrução completa do frontend do aplicativo **Carteira Palito**. O objetivo é criar uma experiência premium, vibrante e intuitiva que combine gestão operacional (estoque/vendas) com funcionalidades de fintech e rede social.

---

## 🎨 Conceito Visual: *Vibrant Cool*
- **Paleta de Cores:** Tons vibrantes de sorvete (Laranja Tangerina, Azul Geada, Amarelo Limão) contrastados com um Dark Mode elegante ou Light Mode ultra-limpo.
- **Estética:** Glassmorphism, Micro-animações para feedback e tipografia moderna (Inter ou Outfit).

---

## 🛠️ Fase 1: Identidade Visual e Fundação
Implementação do novo Design System para garantir consistência em todo o app.
- [x] **1.1 Design Tokens**: Definir paleta de cores primárias, secundárias e semânticas.
- [x] **1.2 Tipografia**: Configurar pesos e escalas de fonte para máxima legibilidade no sol.
- [x] **1.3 Componentes Base**: Criar widgets de botões premium, cards interativos e inputs com validação integrada.
- [x] **1.4 Tematização**: Suporte completo para modo claro e escuro.

## 🔑 Fase 2: Autenticação e Onboarding
Uma primeira impressão marcante para o vendedor.
- [x] **2.1 Splash Screen**: Animação fluida da logo "Palito".
- [ ] **2.2 Login Moderno**: Autenticação biométrica e via telefone/email.
- [x] **2.3 Fluxo de Registro de Vendedor**: Redesign premium multi-etapa com upload de documentos e selfie (Under Review).
- [ ] **2.4 Perfil do Vendedor**: Customização de avatar e bio (fase social inicial).

## 🛒 Fase 3: Hub de Operação Diária (Gestão de Carrinho)
O coração operacional do app.
- [x] **3.1 Carregamento de Carrinho**: Interface visual para selecionar produtos e quantidades ao sair para venda.
- [x] **3.2 Retorno de Estoque**: Check-out do dia, calculando automaticamente as devoluções.
- [x] **3.3 Registro de Vendas**: Interface rápida ("One-Tap") para registrar uma venda realizada na rua.
- [x] **3.4 Suporte Integrado**: Canal direto para reporte de problemas operacionais.

## 💰 Fase 4: Digital Wallet & Transferências (Social Finance)
Transformando o app em uma ferramenta financeira potente.
- [x] **4.1 Saldo Dinâmico**: Visualizador de saldo com histórico detalhado de entradas e saídas.
- [ ] **4.2 Transferência P2P**: Buscar vendedores próximos ou via QR Code para enviar dinheiro.
- [ ] **4.3 Histórico de Transações**: Gráficos simples de fluxo de caixa pessoal.

## 📱 Fase 5: Feed Social e Comunidade
Engajamento entre os colaboradores.
- [x] **5.1 Feed de Atividades**: Postagens de conquistas, fotos do dia e dicas de locais de venda.
- [x] **5.2 Sistema de Comentários**: Interação social em tempo real.
- [x] **5.3 Notificações Push**: Alertas de faturamento, metas atingidas e transferências recebidas.

## 📊 Fase 6: Analytics e Performance (Vendedor)
Entender o lucro para crescer.
- [ ] **6.1 Dashboard de Lucro**: Cálculo automático de lucro bruto vs. despesas.
- [ ] **6.2 Metas Diárias/Mensais**: Barras de progresso para incentivar o atingimento de objetivos.
- [ ] **6.3 Ranking de Vendedores**: Gamificação saudável com os top vendedores da semana.

## 🏢 Fase 7: Central de Gestão (Empresa/Master)
Visão total para o administrador.
- [ ] **7.1 Monitoramento Global**: Visualizar todos os carrinhos ativos e estoque total.
- [ ] **7.2 Gestão de Produtos**: CRUD completo de sabores, preços e categorias.
- [ ] **7.3 Auditoria Financeira**: Relatórios consolidados de vendas totais e faturamento da empresa.

---

> [!IMPORTANT]
> **Nota técnica**: A migração será feita tela a tela, mantendo a compatibilidade com a estrutura de dados atual do Firebase (`produtos`, `transacoes`, `postagem`, `user`).
