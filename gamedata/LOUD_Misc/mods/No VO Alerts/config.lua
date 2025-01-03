config = {
	{
		default = 1,
		label = 'Alert When: Issuing a Ferry order',
		key = 'Ferry',
		help = "Whenver you give a transport a ferry order, a voiceover alert will play if this is set to enabled.",
		values = {
			{
				text = 'Enabled',
				key = 'on',
			},
			{
				text = 'Disabled',
				key = 'off',
			},
		}
	},
	{
		default = 1,
		label = 'Alert When: Own Mass Extractor Attacked',
		key = 'MexAttack',
		help = "Whenver one of your own mass extractors takes damage, a voiceover alert will play if this is set to enabled.",
		values = {
			{
				text = 'Enabled',
				key = 'on',
			},
			{
				text = 'Disabled',
				key = 'off',
			},
		}
	},
	{
		default = 1,
		label = 'Alert When: Enemy Commander Spotted',
		key = 'EnemyCom',
		help = "Whenever an enemy ACU comes into vision, a voiceover alert will play if this is set to enabled.",
		values = {
			{
				text = 'Enabled',
				key = 'on',
			},
			{
				text = 'Disabled',
				key = 'off',
			},
		}
	},
}