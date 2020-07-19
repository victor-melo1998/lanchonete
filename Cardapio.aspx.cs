using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lanchonete2
{
    public partial class Contact : Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            ProcessaLanches();
        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public void ProcessaLanches()
        {

            Response.Write("<div class='row jumbotron text-center'");
            Response.Write("    <div class='col-xs-12 text-center'>");
            Response.Write("        <p class='fontePromocoes' style='font-weight: bold'>NOSSOS LANCHES</p>");
            Response.Write("    </div>");
            Response.Write("</div>");


            Response.Write("<div class='row' style='margin:20px'>");
            Response.Write("    <div class='col-xs-4 text-left'>");
            Response.Write("        <img class='imgCardapio' src='Imagens/Cardapio.jpeg'/>");
            Response.Write("    </div>");
            Response.Write("    <div class='col-xs-6 text-center'>");

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

                    Response.Write("<div class='row'>");
                    Response.Write("    <div class='col-xs-6 text-center' style='height:90px'>");
                    Response.Write("        <span class='text-info fontePromocoes'>" + dr["nome"] + "</span><br>");
                                            ProcessaIngredientes(Convert.ToInt32(dr["idLanche"]));
                    Response.Write("    </div>");
                    Response.Write("</div>");




                }
            }
            Response.Write("    </div>");
            Response.Write("</div>");

            

        }

        public void ProcessaIngredientes(int idLanche)
        {
            Response.Write("<div class='row'>");
            Response.Write("    <div class='col-xs-12 text-center'>");
            Response.Write("    <span class='fontePromocoes'>Ingredientes:</span> ");
            
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
                    Response.Write("<span class='fontePromocoes'>" + dr["nome"] + ",</span>" );
                }

                Response.Write("<br >");

            }


            Response.Write("</div>");
            Response.Write("</div>");
        }

        protected void ButtonD_Click(object sender, EventArgs e)
        {
            Response.Redirect("Pedido.aspx");
        }
    }
}