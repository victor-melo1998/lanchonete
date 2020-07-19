<%@ Page Title="Pedido" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Pedido.aspx.cs" Inherits="Lanchonete2.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="col-xs-4">
            <button class="btn-success form-control" onclick="calculaValor()">CALCULAR VALOR</button>
        </div>
    </div>

    <script type="text/javascript">

        function calculaValor() {
            if (!$('input:radio[name=rad_lanche]').is(':checked')) {
                alert('Por favor selecione um lanche!');
                return false;
            }
            
            $('input:radio[name=rad_lanche]').each(function () {
                //Verifica qual está selecionado
                if ($(this).is(':checked')) {
                    idLanche = parseInt($(this).val());
                } 
            });

            var total = 0;
            var totalAux = 0;
            var totalAux2 = 0;
            var resto = 0;
            var restoQueijo = 0;

            if (idLanche == "1") {

                var valor1 = $('#txtQtde_1_2').attr('data-value').replace(",", ".");
                var multiplicacao1 = parseFloat(valor1 * $('#txtQtde_1_2').val());

                var valor2 = $('#txtQtde_1_3').attr('data-value').replace(",", ".");
                var multiplicacao2 = parseFloat(valor2 * $('#txtQtde_1_3').val());

                var valor3 = $('#txtQtde_1_5').attr('data-value').replace(",", ".");
                var multiplicacao3 = parseFloat(valor3 * $('#txtQtde_1_5').val());

                var valor4 = $('#txtQtde_1_1').attr('data-value').replace(",", ".");
                var multiplicacao4 = parseFloat(valor4 * $('#txtQtde_1_1').val());

                if ($('#txtQtde_1_3').val() >= "3" && $('#txtQtde_1_5').val() >= "3") {

                    if ($('#txtQtde_1_3').val() % 3 == 0) {
                        resto = $('#txtQtde_1_3').val() / 3 * 1;
                        multiplicacao2 = parseFloat(valor2 * ($('#txtQtde_1_3').val() - resto));
                        total = (multiplicacao1 + multiplicacao2 + multiplicacao3 + multiplicacao4).toFixed(2);


                    }

                    if ($('#txtQtde_1_5').val() % 3 == 0) {
                        restoQueijo = $('#txtQtde_1_5').val() / 3 * 1;
                        multiplicacao3 = parseFloat(valor3 * ($('#txtQtde_1_5').val() - restoQueijo));
                        total = (multiplicacao1 + multiplicacao2 + multiplicacao3 + multiplicacao4).toFixed(2);

                    }
                }
                else if ($('#txtQtde_1_3').val() >= "3") {
                   
                    if ($('#txtQtde_1_3').val() % 3 == 0) {
                        resto = $('#txtQtde_1_3').val() / 3 * 1;
                        multiplicacao2 = parseFloat(valor2 * ($('#txtQtde_1_3').val() - resto));
                        total = (multiplicacao1 + multiplicacao2 + multiplicacao3 + multiplicacao4).toFixed(2);

                    }
                }
                else if ($('#txtQtde_1_5').val() >= "3") {
                    if ($('#txtQtde_1_5').val() % 3 == 0) {
                        restoQueijo = $('#txtQtde_1_5').val() / 3 * 1;
                        multiplicacao3 = parseFloat(valor3 * ($('#txtQtde_1_5').val() - restoQueijo));
                        total = (multiplicacao1 + multiplicacao2 + multiplicacao3 + multiplicacao4).toFixed(2);
                    }

                }
                else {
                    total = (multiplicacao1 + multiplicacao2 + multiplicacao3 + multiplicacao4).toFixed(2);
                }

                if ($('#txtQtde_1_1').val() > "0" && $('#txtQtde_1_2').val() == "0") {
                    totalAux = total;
                    totalAux2 = totalAux * (10 / 100);

                    total = (totalAux - totalAux2).toFixed(2);
                }

            }
            else if (idLanche == "2") {

                var valor5 = $('#txtQtde_2_3').attr('data-value').replace(",", ".");
                var multiplicacao5 = parseFloat(valor5 * $('#txtQtde_2_3').val());

               
                var valor6 = $('#txtQtde_2_5').attr('data-value').replace(",", ".");
                var multiplicacao6 = parseFloat(valor6 * $('#txtQtde_2_5').val());

                var valor7 = $('#txtQtde_2_1').attr('data-value').replace(",", ".");
                var multiplicacao7 = parseFloat(valor7 * $('#txtQtde_2_1').val());

                if ($('#txtQtde_2_3').val() >= "3" && $('#txtQtde_2_5').val() >= "3") {
                    if ($('#txtQtde_2_3').val() % 3 == 0) {
                        resto = $('#txtQtde_2_3').val() / 3 * 1;
                        multiplicacao5 = parseFloat(valor5 * ($('#txtQtde_2_3').val() - resto));
                        total = (multiplicacao5 + multiplicacao6 + multiplicacao7).toFixed(2);
                    }

                    if ($('#txtQtde_2_5').val() % 3 == 0) {
                        restoQueijo = $('#txtQtde_2_5').val() / 3 * 1;
                        multiplicacao6 = parseFloat(valor6 * ($('#txtQtde_2_5').val() - restoQueijo));
                        total = (multiplicacao5 + multiplicacao6 + multiplicacao7).toFixed(2);
                    }
                }
                else if ($('#txtQtde_2_3').val() >= "3") {
                    if ($('#txtQtde_2_3').val() % 3 == 0) {
                        resto = $('#txtQtde_2_3').val() / 3 * 1;
                        multiplicacao5 = parseFloat(valor5 * ($('#txtQtde_2_3').val() - resto));
                        total = (multiplicacao5 + multiplicacao6 + multiplicacao7).toFixed(2);
                    }
                }
                else if ($('#txtQtde_2_5').val() >= "3") {
                    if ($('#txtQtde_2_5').val() % 3 == 0) {
                        restoQueijo = $('#txtQtde_2_5').val() / 3 * 1;
                        multiplicacao6 = parseFloat(valor6 * ($('#txtQtde_2_5').val() - restoQueijo));
                        total = (multiplicacao5 + multiplicacao6 + multiplicacao7).toFixed(2);
                    }
                }
                else {
                    total = (multiplicacao5 + multiplicacao6 + multiplicacao7).toFixed(2);   
                }
               
                

            }
            else if (idLanche == "3") {

                var valor8 = $('#txtQtde_3_4').attr('data-value').replace(",", ".");
                var multiplicacao8 = parseFloat(valor8 * $('#txtQtde_3_4').val());

                var valor9 = $('#txtQtde_3_3').attr('data-value').replace(",", ".");
                var multiplicacao9 = parseFloat(valor9 * $('#txtQtde_3_3').val());

                var valor10 = $('#txtQtde_3_5').attr('data-value').replace(",", ".");
                var multiplicacao10 = parseFloat(valor10 * $('#txtQtde_3_5').val());

                var valor11 = $('#txtQtde_3_1').attr('data-value').replace(",", ".");
                var multiplicacao11 = parseFloat(valor11 * $('#txtQtde_3_1').val());

                if ($('#txtQtde_3_3').val() >= "3" && $('#txtQtde_3_5').val() >= "3") {

                    if($('#txtQtde_3_3').val() % 3 == 0) {
                        resto = $('#txtQtde_3_3').val() / 3 * 1;
                        multiplicacao9 = parseFloat(valor9 * ($('#txtQtde_3_3').val() - resto));
                        total = (multiplicacao8 + multiplicacao9 + multiplicacao10 + multiplicacao11).toFixed(2);

                    }

                    if ($('#txtQtde_3_5').val() % 3 == 0) {
                        restoQueijo = $('#txtQtde_3_5').val() / 3 * 1;
                        multiplicacao10 = parseFloat(valor10 * ($('#txtQtde_3_5').val() - restoQueijo));
                        total = (multiplicacao8 + multiplicacao9 + multiplicacao10 + multiplicacao11).toFixed(2);
                    }
                }

                else if ($('#txtQtde_3_3').val() >= "3") {
                    if ($('#txtQtde_3_3').val() % 3 == 0) {
                        resto = $('#txtQtde_3_3').val() / 3 * 1;
                        multiplicacao9 = parseFloat(valor9 * ($('#txtQtde_3_3').val() - resto));
                        total = (multiplicacao8 + multiplicacao9 + multiplicacao10 + multiplicacao11).toFixed(2);
                        
                    }
                }
                else if ($('#txtQtde_3_5').val() >= "3") {
                    if ($('#txtQtde_3_5').val() % 3 == 0) {
                        restoQueijo = $('#txtQtde_3_5').val() / 3 * 1;
                        multiplicacao10 = parseFloat(valor10 * ($('#txtQtde_3_5').val() - restoQueijo));
                        total = (multiplicacao8 + multiplicacao9 + multiplicacao10 + multiplicacao11).toFixed(2);
                    }
                }
                else {
                    total = (multiplicacao8 + multiplicacao9 + multiplicacao10 + multiplicacao11).toFixed(2);
                }

                
            }
            else if (idLanche == "4") {

                var valor12 = $('#txtQtde_4_4').attr('data-value').replace(",", ".");
                var multiplicacao12 = parseFloat(valor12 * $('#txtQtde_4_4').val());

                var valor13 = $('#txtQtde_4_2').attr('data-value').replace(",", ".");
                var multiplicacao13 = parseFloat(valor13 * $('#txtQtde_4_2').val());

                var valor14 = $('#txtQtde_4_3').attr('data-value').replace(",", ".");
                var multiplicacao14 = parseFloat(valor14 * $('#txtQtde_4_3').val());

                var valor15 = $('#txtQtde_4_5').attr('data-value').replace(",", ".");
                var multiplicacao15 = parseFloat(valor15 * $('#txtQtde_4_5').val());

                var valor16 = $('#txtQtde_4_1').attr('data-value').replace(",", ".");
                var multiplicacao16 = parseFloat(valor16 * $('#txtQtde_4_1').val());

                
                if ($('#txtQtde_4_3').val() >= "3" && $('#txtQtde_4_5').val() >= "3") {
                    if ($('#txtQtde_4_3').val() % 3 == 0) {
                        resto = $('#txtQtde_4_3').val() / 3 * 1;
                        multiplicacao14 = parseFloat(valor14 * ($('#txtQtde_4_3').val() - resto));
                        total = (multiplicacao12 + multiplicacao13 + multiplicacao14 + multiplicacao15 + multiplicacao16).toFixed(2);

                       
                    }

                    if ($('#txtQtde_4_5').val() % 3 == 0) {
                        restoQueijo = $('#txtQtde_4_5').val() / 3 * 1;
                        multiplicacao15 = parseFloat(valor15 * ($('#txtQtde_4_5').val() - restoQueijo));
                        total = (multiplicacao12 + multiplicacao13 + multiplicacao14 + multiplicacao15 + multiplicacao16).toFixed(2);

                    }
                }

                else if ($('#txtQtde_4_3').val() >= "3") {
                    if ($('#txtQtde_4_3').val() % 3 == 0) {
                        resto = $('#txtQtde_4_3').val() / 3 * 1;
                        multiplicacao14 = parseFloat(valor14 * ($('#txtQtde_4_3').val() - resto));
                        total = (multiplicacao12 + multiplicacao13 + multiplicacao14 + multiplicacao15 + multiplicacao16).toFixed(2);

                    }
                }
                else if ($('#txtQtde_4_5').val() >= "3") {
                    if ($('#txtQtde_4_5').val() % 3 == 0) {
                        restoQueijo = $('#txtQtde_4_5').val() / 3 * 1;
                        multiplicacao15 = parseFloat(valor15 * ($('#txtQtde_4_5').val() - restoQueijo));
                        total = (multiplicacao12 + multiplicacao13 + multiplicacao14 + multiplicacao15 + multiplicacao16).toFixed(2);

                    }
                }
                else {
                    total = (multiplicacao12 + multiplicacao13 + multiplicacao14 + multiplicacao15 + multiplicacao16).toFixed(2);
                }


                if ($('#txtQtde_4_1').val() > "0" && $('#txtQtde_4_2').val() == "0") {

                    totalAux = total;
                    totalAux2 = totalAux * (10 / 100);

                    total = (totalAux - totalAux2).toFixed(2);
                }
                
            }

            alert("O valor total do seu lanche é: R$" + total);
            
        }

        function verificaLancheEscolhido(pint_idLanche) {
            if (pint_idLanche == "1") {

                document.getElementById('txtQtde_2_3').disabled = true;
                document.getElementById('txtQtde_2_1').disabled = true;
                document.getElementById('txtQtde_2_5').disabled = true;

                document.getElementById('txtQtde_3_4').disabled = true;
                document.getElementById('txtQtde_3_1').disabled = true;
                document.getElementById('txtQtde_3_3').disabled = true;
                document.getElementById('txtQtde_3_5').disabled = true;

                document.getElementById('txtQtde_4_4').disabled = true;
                document.getElementById('txtQtde_4_1').disabled = true;
                document.getElementById('txtQtde_4_2').disabled = true;
                document.getElementById('txtQtde_4_3').disabled = true;
                document.getElementById('txtQtde_4_5').disabled = true;
                
            }
            else if (pint_idLanche == "2") {


                document.getElementById('txtQtde_1_2').disabled = true;
                document.getElementById('txtQtde_1_3').disabled = true;
                document.getElementById('txtQtde_1_1').disabled = true;
                document.getElementById('txtQtde_1_5').disabled = true;    

                document.getElementById('txtQtde_2_3').disabled = false;
                document.getElementById('txtQtde_2_1').disabled = false;
                document.getElementById('txtQtde_2_5').disabled = false;

                document.getElementById('txtQtde_3_4').disabled = true;
                document.getElementById('txtQtde_3_3').disabled = true;
                document.getElementById('txtQtde_3_1').disabled = true;
                document.getElementById('txtQtde_3_5').disabled = true;

                document.getElementById('txtQtde_4_4').disabled = true;
                document.getElementById('txtQtde_4_2').disabled = true;
                document.getElementById('txtQtde_4_3').disabled = true;
                document.getElementById('txtQtde_4_1').disabled = true;
                document.getElementById('txtQtde_4_5').disabled = true;
            }
            else if (pint_idLanche == "3") {

                document.getElementById('txtQtde_1_2').disabled = true;
                document.getElementById('txtQtde_1_3').disabled = true;
                document.getElementById('txtQtde_1_5').disabled = true;
                document.getElementById('txtQtde_1_1').disabled = true;

                document.getElementById('txtQtde_2_3').disabled = true;
                document.getElementById('txtQtde_2_5').disabled = true;
                document.getElementById('txtQtde_2_1').disabled = true;

                document.getElementById('txtQtde_3_4').disabled = false;
                document.getElementById('txtQtde_3_3').disabled = false;
                document.getElementById('txtQtde_3_5').disabled = false;
                document.getElementById('txtQtde_3_1').disabled = false;

                document.getElementById('txtQtde_4_4').disabled = true;
                document.getElementById('txtQtde_4_2').disabled = true;
                document.getElementById('txtQtde_4_3').disabled = true;
                document.getElementById('txtQtde_4_5').disabled = true;
                document.getElementById('txtQtde_4_1').disabled = true;

            }
            else if (pint_idLanche == "4") {

                document.getElementById('txtQtde_1_2').disabled = true;
                document.getElementById('txtQtde_1_3').disabled = true;
                document.getElementById('txtQtde_1_5').disabled = true;
                document.getElementById('txtQtde_1_1').disabled = true;

                document.getElementById('txtQtde_2_3').disabled = true;
                document.getElementById('txtQtde_2_5').disabled = true;
                document.getElementById('txtQtde_2_1').disabled = true;

                document.getElementById('txtQtde_3_4').disabled = true;
                document.getElementById('txtQtde_3_3').disabled = true;
                document.getElementById('txtQtde_3_5').disabled = true;
                document.getElementById('txtQtde_3_1').disabled = true;

                document.getElementById('txtQtde_4_4').disabled = false;
                document.getElementById('txtQtde_4_2').disabled = false;
                document.getElementById('txtQtde_4_3').disabled = false;
                document.getElementById('txtQtde_4_5').disabled = false;
                document.getElementById('txtQtde_4_1').disabled = false;

            }
        }

    </script>

</asp:Content>
