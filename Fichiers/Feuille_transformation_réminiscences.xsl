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
                <title>Feuille de transformation réminiscences bibliques Carmina</title>
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
    
    <!-- Je copie-colle le contenu de <p>.-->
    
    <xsl:template match="p">
        <p class="verset">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    
    <!-- Je copie-colle le contenu de <div> et je convertis l'attribut @xml:id en attribut id= en gardant la valeur de l'attribut.-->
    
    <xsl:template match="div[@xml:id]">
        <div class="bible" id="{@xml:id}">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <!-- Je traduis head en h2 dans les <div> -->
    
    <xsl:template match="div/head">
        <h2 class="accueil_bible">
            <xsl:apply-templates/>
        </h2>
    </xsl:template>
    
    <!-- Je copie-colle le contenu de <span> que je transforme en <p class="reminiscence"> (<p> pour avoir un interligne) et en <a @name=> et je convertis l'attribut @xml:id en attribut id= en gardant la valeur de l'attribut. -->

    
    <xsl:template match="span[@xml:id]">
        <p class="verset" id="{@xml:id}">
                <xsl:apply-templates/>  
        </p>
    </xsl:template>
    
    <!-- Je convertis la balise <title> en balise <a> avec un attribut @class="reference". -->
    <xsl:template match="title">
        <a class="reference_verset">
            <xsl:apply-templates/>
        </a>
    </xsl:template>
      
    
</xsl:stylesheet>