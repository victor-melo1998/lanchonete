<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Lanchonete2._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server" EnablePageMethods="true">

    <div class="jumbotron">
        <h1 style="font-family: Georgia;">BURGERS</h1>
        
    </div>

    <div class="row">
        <div class="col-xs-12 text-center">
            <img style="width:1000px;height:500px" src="Imagens/ImagemPrincipal2.jpeg" />
        </div>
    </div>

    <div class="row">
        
        <div class="col-md-4">
            <h2 style="font-family: Georgia;">Menu</h2>
            <p>
                <a class="btn btn-default" href="Cardapio.aspx">Clique aqui para ver o cardápio</a>
            </p>
        </div>

        <div class="col-md-4">
            <h2 style="font-family: Georgia;">Pedido</h2>
            <p>
                <a class="btn btn-default" href="Pedido.aspx">Clique aqui para fazer o seu pedido</a>
            </p>
        </div>
        
    </div>
    
</asp:Content>
