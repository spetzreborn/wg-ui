
<script>
    import SuDisclaimer from './SuDisclaimer.svelte';
    import { onMount } from 'svelte';
    import { getContext } from 'svelte';
    const { open } = getContext('simple-modal');


    onMount(() => {
        showDisclaimer();
    });

    const showDisclaimer = () => {
        open(SuDisclaimer, { message: "Viktigt meddelande" });
    };

</script>
