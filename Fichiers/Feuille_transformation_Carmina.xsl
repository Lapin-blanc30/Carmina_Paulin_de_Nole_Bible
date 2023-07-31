<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    
    <xsl:output method="html" encoding="UTF-8"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Carmina Natalicia</title>
                <link rel="stylesheet" type="text/css" href="Style_Carmina_reminiscences.css"/>
            </head>
            
            <body>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    
    <!-- Je ne copie pas le contenu de <teiHeader> -->
    
    <xsl:template match="teiHeader"/>
    
    <!-- Je traduis head en h1 au début du texte. -->
    
    <xsl:template match="head">
        <h1>
            <xsl:apply-templates/>
        </h1>
    </xsl:template>
    
    <!-- Je copie-colle le contenu de <div1> et je convertis l'attribut @xml:id en attribut id= en gardant la valeur de l'attribut.-->
    
    <xsl:template match="div1[@xml:id]">
        <div class="poeme" id="{@xml:id}">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <!-- Je traduis head en h2 dans les <div1> -->
    
    <xsl:template match="div1/head">
        <h2 class="poeme">
            <xsl:apply-templates/>
        </h2>
    </xsl:template>
    
    <!-- Je copie-colle le contenu de <p>.-->
    
    <xsl:template match="p">
        <div class="contenu_poeme">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <!-- Je copie-colle le contenu de <seg> que je transforme en <div class="seg"> et je convertis l'attribut @xml:id en attribut id= en gardant la valeur de l'attribut. -->
    
    <xsl:template match="seg[@xml:id]">
        <div class="seg" id="{@xml:id}">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <!-- Je copie-colle le contenu de <span type=vers> que je convertis en <div class="vers" -->
    <xsl:template match="span[@type='vers']">
        <div class="vers">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    
    <!-- Je copie-colle le contenu de la balise <lb> ainsi que la valeur de l'attribut @n= et j'ajoute un retour à la ligne après chaque <lb>. -->
    
    <xsl:template match="lb">
        <xsl:apply-templates/>
        <br/>
        <span style="margin-right: 20px;">
            <xsl:value-of select="@n"/> <!-- Affiche la valeur de l'attribut @n i.e. la numérotation des vers ici -->
        </span> 
        <xsl:text>&#10;</xsl:text> <!-- Ajoute un caractère de saut de ligne -->
    </xsl:template>
    
    
    <!-- Je transforme <listRef> en <div class="reference">. -->
    
    <xsl:template match="listRef">
        <!-- Ajoute la div avec la classe "liste" -->
        <div class="liste">
            <button class="dropbtn_ref">Réminiscence(s) biblique(s) ▼</button>
            <div class="reference">
                <xsl:apply-templates/>
            </div>
        </div>
    </xsl:template>
    
    
    
    <!-- Je transforme la balise <ref> et son attribut @cRef= en balise <a @href=>. -->
    <xsl:template match="ref[@cRef]">
            <a href="./Output_reminiscences_carmina.html#{@cRef}" target="_blank">
                <xsl:apply-templates/>
            </a>
    </xsl:template>
    
    
</xsl:stylesheet>