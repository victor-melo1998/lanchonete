using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lanchonete2
{
    public partial class About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            ProcessaLanches();
        }

        public void ProcessaLanches()
        {

            Response.Write("<div class='row jumbotron'>");
            Response.Write("    <div class='col-xs-12 text-center' style='margin:20px'>");
            Response.Write("        <p class='fontePromocoes' style='font-weight: bold'>Monte seu lanche</p>");
            Response.Write("    </div>");
            Response.Write("</div>");

            Response.Write("<div class='row'>");
            Response.Write("    <div class='col-xs-12 text-center'>");
            Response.Write("        <img class='imgPedido' src='Imagens/Pedido.jpeg'/>");
            Response.Write("    </div>");
            Response.Write("</div>");

            Response.Write("<div class='row'>");
            Response.Write("    <div class='col-xs-12 text-center'>");
            Response.Write("        <p class='fontePromocoes' style='font-weight: bold'>Nossas promoções</p>");
            Response.Write("    </div>");
            Response.Write("</div>");

            Response.Write("<div class='row'>");
            Response.Write("    <div class='col-xs-2 text-center'>");
            Response.Write("        <p class='fontePromocoes' style='font-style: italic;'>Light</p>");
            Response.Write("    </div>");
            Response.Write("    <div class='col-xs-6 text-left'>");
            Response.Write("        <p class='fontePromocoes' style='font-style: italic;'>Se o lanche tem alface e não tem bacon, ganha 10% de desconto.</p>");
            Response.Write("    </div>");
            Response.Write("</div>");

            Response.Write("<div class='row'>");
            Response.Write("    <div class='col-xs-2 text-center'>");
            Response.Write("        <p class='fontePromocoes' style='font-style: italic;'>Muita carne</p>");
            Response.Write("    </div>");
            Response.Write("    <div class='col-xs-6 text-left'>");
            Response.Write("        <p class='fontePromocoes' style='font-style: italic;'>A cada 3 porções de carne o cliente só paga 2. Se o lanche tiver 6 porções, o cliente pagará 4.</p>");
            Response.Write("    </div>");
            Response.Write("</div>");

            Response.Write("<div class='row'>");
            Response.Write("    <div class='col-xs-2 text-center'>");
            Response.Write("        <p class='fontePromocoes' style='font-style: italic;'>Muito queijo</p>");
            Response.Write("    </div>");
            Response.Write("    <div class='col-xs-6 text-left'>");
            Response.Write("        <p class='fontePromocoes' style='font-style: italic;'>A cada 3 porções de queijo o cliente só paga 2. Se o lanche tiver 6 porções, o cliente pagará 4.</p>");
            Response.Write("    </div>");
            Response.Write("</div>");

            

            using (SqlConnection conn = new SqlConnection("Server=localhost;Database=db_lanchonete;Integrated Security=True;"))
            {
                //Criando o SqlCommand
                SqlCommand cmd = new SqlCommand();
                //Setando a conexão para o SqlCommand
                cmd.Connection = conn;
                //Nome da stored procedure
                cmd.CommandText = "sp_selListarLanches";
                //Definindo o tipo de comando como StoredProcedure
                cmd.CommandType = System.Data.CommandType.StoredProcedure;


                //Abrir a conexão
                conn.Open();

                //CommandBehavior vai fechar a conexão após usar o DataReader
                SqlDataReader dr = cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);

                //Lendo o DataReader
                while (dr.Read())
                {
                    //Imprimir os dados do DataReader
                    Response.Write("<div class='row' style='margin:20px'>");
                    Response.Write("    <div class='col-xs-12 text-left'>");
                    Response.Write("        <input type='radio' name='rad_lanche' value='" + Convert.ToInt32(dr["idLanche"])  + "' onclick='javascript: verificaLancheEscolhido(" + Convert.ToInt32(dr["idLanche"]) + ")' /> <span class='text-info fontePromocoes'>" + dr["nome"] + "</span><br>");

                    ProcessaIngredientes(Convert.ToInt32(dr["idLanche"]));

                    Response.Write("    </div>");
                    Response.Write("</div>");

                    
                }
            }
        }

        public void ProcessaIngredientes(int idLanche)
        {

            Response.Write("<div class='row'>");
            Response.Write("    <div class='col-xs-12 text-left'>");
            Response.Write("        &nbsp");
            Response.Write("    </div>");
            Response.Write("    <div class='col-xs-12 text-left'>");
            
            using (SqlConnection conn = new SqlConnection("Server=localhost;Database=db_lanchonete;Integrated Security=True;"))
            {
                //Criando o SqlCommand
                SqlCommand cmd = new SqlCommand();
                //Setando a conexão para o SqlCommand
                cmd.Connection = conn;
                //Nome da stored procedure
                cmd.CommandText = "sp_selListarIngredientes";
                //Definindo o tipo de comando como StoredProcedure
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                //Adicionando parametros
                cmd.Parameters.AddWithValue("@idLanche", idLanche);

                //Abrir a conexão
                conn.Open();

                //CommandBehavior vai fechar a conexão após usar o DataReader
                SqlDataReader dr = cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);

                //Lendo o DataReader
                while (dr.Read())
                {
                    Response.Write("<span class='fontePromocoes'>" + dr["nome"] + " - Preço do ingrediente - R$" + dr["valor"] + "</span> <input type='text' class='form-control' placeholder='Digite aqui a quantidade de cada ingrediente' data-value='" + dr["valor"] + "' id='txtQtde_" + idLanche + "_" + dr["idIngrediente"] + "' name='txtQtde_" + idLanche + "_" + dr["idIngrediente"] + "'><br>");

                }

                Response.Write("<br>");

            }

            Response.Write("    </div>");
            Response.Write("</div>");
        }


    }
}