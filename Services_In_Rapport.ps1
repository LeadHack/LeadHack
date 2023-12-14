function Get-ServiceReport {
    param (
        [string]$cheminRapport = "ServiceReport.txt"
    )

    # Récupérer la liste de tous les services Windows
    $services = Get-Service | Select-Object DisplayName, Status

    # Obtenir la date et l'heure actuelles pour le rapport
    $date = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

    # Créer le contenu du rapport
    $contenuRapport = @"
    Rapport de Surveillance des Services Windows - $date

    =============================================

"@

    # Ajouter les détails de chaque service au rapport
    foreach ($service in $services) {
        $contenuRapport += "Service : $($service.DisplayName)`tÉtat : $($service.Status)`n"
    }

    # Écrire le rapport dans un fichier
    $contenuRapport | Out-File -FilePath $cheminRapport

    Write-Host "Le rapport a été généré avec succès dans le fichier : $cheminRapport"
}

# Appeler la fonction avec le chemin de rapport par défaut
Get-ServiceReport
